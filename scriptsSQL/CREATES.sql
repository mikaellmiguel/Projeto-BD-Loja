CREATE TABLE Clientes (
	id_cliente SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	telefone VARCHAR(20),
	email VARCHAR(100),
	cep VARCHAR(8),
	rua VARCHAR(50),
	numero INT CHECK(numero >= 0),
	cidade VARCHAR(50),
	estado VARCHAR(2), /* Sigla do Estado */
	data_cadastro DATE DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT verify_estado CHECK(estado ~ '^[A-Z]{2}$'),
	CONSTRAINT verify_cep CHECK(cep ~ '^[0-9]{8}$')
);

CREATE TABLE Pessoa_Juridica (
	id_cliente INT PRIMARY KEY REFERENCES Clientes(id_cliente) ON DELETE CASCADE,
	cnpj VARCHAR(14) UNIQUE NOT NULL,
	razao_social VARCHAR(255) NOT NULL,
	CONSTRAINT verify_cnpj CHECK(cnpj ~ '^[0-9]{14}$')
);

CREATE TABLE Pessoa_Fisica (
	id_cliente INT PRIMARY KEY REFERENCES Clientes(id_cliente) ON DELETE CASCADE,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	CONSTRAINT verify_cpf CHECK(cpf ~ '^[0-9]{11}$')
);

CREATE TABLE Funcionarios (
	matricula SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	carga_horaria INT CHECK(carga_horaria > 0),
	salario DECIMAL(10,2) NOT NULL,
	data_admissao DATE NOT NULL,
	CONSTRAINT verify_cpf CHECK(cpf ~ '^[0-9]{11}$')
);

CREATE TABLE Vendedor (
	matricula INT PRIMARY KEY REFERENCES Funcionarios(matricula) ON DELETE CASCADE ON UPDATE CASCADE,
	meta_vendas DECIMAL(10,2),
	porcentagem_comissao DECIMAL(5,2)
);

CREATE TABLE Repositor (
	matricula INT PRIMARY KEY REFERENCES Funcionarios(matricula) ON DELETE CASCADE ON UPDATE CASCADE,
	setor_estoque VARCHAR(255) NOT NULL
);

CREATE TABLE Vendas (
	nota_fiscal SERIAL PRIMARY KEY,
	matr_vendedor INT REFERENCES Vendedor(matricula) ON DELETE SET NULL ON UPDATE CASCADE,
	id_cliente INT REFERENCES Clientes(id_cliente) ON DELETE SET NULL,
	forma_pagto VARCHAR(50) NOT NULL,
	data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Produtos (
	cod_barras VARCHAR(50) PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	marca VARCHAR(255),
	preco DECIMAL(10,2) NOT NULL,
	descricao TEXT
);


CREATE TABLE Fornecedor (
	cnpj VARCHAR(14) PRIMARY KEY,
	email VARCHAR(255) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	razao_social VARCHAR(255) NOT NULL,
	CONSTRAINT verify_cnpj CHECK(cnpj ~ '^[0-9]{14}$')
);

CREATE DOMAIN genero_domain AS VARCHAR(10)
CHECK (VALUE IN ('Masculino', 'Feminino', 'Unissex'));

CREATE TABLE Calca (
	cod_barras VARCHAR(50) PRIMARY KEY REFERENCES Produtos(cod_barras) ON DELETE CASCADE,
	estilo VARCHAR(255),
	genero genero_domain,
	tecido VARCHAR(255)
);

CREATE TABLE Camisa (
	cod_barras VARCHAR(50) PRIMARY KEY REFERENCES Produtos(cod_barras) ON DELETE CASCADE,
	estilo VARCHAR(255),
	genero genero_domain,
	tecido VARCHAR(255)
);

CREATE TABLE Calcado (
	cod_barras VARCHAR(50) PRIMARY KEY REFERENCES Produtos(cod_barras) ON DELETE CASCADE,
	tipo VARCHAR(255) NOT NULL,
	genero genero_domain,
	cor VARCHAR(50)
);

CREATE TABLE Calcado_Material (
	cod_barras VARCHAR(50) REFERENCES Calcado(cod_barras) ON DELETE CASCADE,
	material VARCHAR(40),
	PRIMARY KEY (cod_barras, material)
);


CREATE TABLE Produto_Tamanho (
    cod_barras VARCHAR(50) REFERENCES Produtos(cod_barras) ON DELETE CASCADE,
    especificacao VARCHAR(5) NOT NULL,  -- Pode ser tamanho (P, M, G) ou numeração (38, 39, 40)
    qtd_estoque INT NOT NULL CHECK (qtd_estoque >= 0),
    PRIMARY KEY (cod_barras, especificacao)
);

CREATE TABLE Vendas_Produto (
	nota_fiscal INT REFERENCES Vendas(nota_fiscal) ON DELETE CASCADE,
	cod_barras VARCHAR(50) REFERENCES Produtos(cod_barras) ON DELETE SET NULL,
	quantidade INT NOT NULL CHECK(quantidade > 0),
	especificacao VARCHAR(5),
	FOREIGN KEY (cod_barras, especificacao) REFERENCES Produto_Tamanho(cod_barras, especificacao),
	PRIMARY KEY (nota_fiscal, cod_barras, especificacao)
);

CREATE TABLE Fornecedor_Produto (
	cnpj VARCHAR(14) REFERENCES Fornecedor(cnpj) ON DELETE CASCADE ON UPDATE CASCADE,
	cod_barras VARCHAR(50) REFERENCES Produtos(cod_barras) ON DELETE CASCADE,
	quantidade INT NOT NULL CHECK(quantidade > 0),
	especificacao VARCHAR(5) NOT NULL,
	FOREIGN KEY (cod_barras, especificacao) REFERENCES Produto_Tamanho(cod_barras, especificacao),
	PRIMARY KEY (cnpj, cod_barras, especificacao)
);


-- Verificação de Estoque antes da Venda
CREATE FUNCTION verificar_estoque()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se a quantidade em estoque é suficiente
    IF (SELECT qtd_estoque FROM Produto_Tamanho WHERE cod_barras = NEW.cod_barras AND especificacao = NEW.especificacao) < NEW.quantidade THEN
        RAISE EXCEPTION 'Estoque insuficiente para o produto % com especificação %', NEW.cod_barras, NEW.especificacao;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verificar_estoque
BEFORE INSERT ON Vendas_Produto
FOR EACH ROW
EXECUTE FUNCTION verificar_estoque();

-- Atulizar estoque com Venda de Produtos
CREATE FUNCTION atualizar_estoque()
RETURNS TRIGGER AS $$
BEGIN
    -- Atualiza o estoque
    UPDATE Produto_Tamanho
    SET qtd_estoque = qtd_estoque - NEW.quantidade
    WHERE cod_barras = NEW.cod_barras AND especificacao = NEW.especificacao;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_atualizar_estoque
AFTER INSERT ON Vendas_Produto
FOR EACH ROW
EXECUTE FUNCTION atualizar_estoque();


-- Criando a função para atualizar o estoque ao receber produtos do fornecedor
CREATE FUNCTION atualizar_estoque_fornecedor()
RETURNS TRIGGER AS $$
BEGIN
    -- Atualiza a quantidade em estoque do produto recebido
    UPDATE Produto_Tamanho
    SET qtd_estoque = qtd_estoque + NEW.quantidade
    WHERE cod_barras = NEW.cod_barras AND especificacao = NEW.especificacao;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criando o trigger para chamar a função após inserção de novos fornecimentos
CREATE TRIGGER trigger_atualizar_estoque_fornecedor
AFTER INSERT ON Fornecedor_Produto
FOR EACH ROW
EXECUTE FUNCTION atualizar_estoque_fornecedor();

-- View para listar vendas com valor total
CREATE VIEW view_venda_valor AS
SELECT V.*,
       SUM(VP.quantidade * P.preco) AS valor_total
FROM Vendas V
JOIN Vendas_Produto VP ON V.nota_fiscal = VP.nota_fiscal
JOIN Produtos P ON VP.cod_barras = P.cod_barras
GROUP BY V.nota_fiscal;