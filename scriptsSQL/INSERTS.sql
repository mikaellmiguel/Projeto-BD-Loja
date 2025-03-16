-- Inserindo Clientes (Apenas Pessoa Jurídica)
INSERT INTO Clientes (nome, telefone, email, cep, rua, numero, cidade, estado)
VALUES 
('Tech Solutions', '11987654321', 'contato@techsolutions.com', '01001000', 'Av. Paulista', 1000, 'São Paulo', 'SP'),
('Mega Store', '21976543210', 'vendas@megastore.com', '20040000', 'Rua da Quitanda', 500, 'Rio de Janeiro', 'RJ'),
('Fashion Trends', '31987654321', 'atendimento@fashiontrends.com', '30140071', 'Av. Afonso Pena', 700, 'Belo Horizonte', 'MG'),
('Urban Style', '11955554444', 'contato@urbanstyle.com', '04546042', 'Rua Haddock Lobo', 1200, 'São Paulo', 'SP'),
('Moda Elegante', '11933332222', 'suporte@modaelegante.com', '22290040', 'Rua Visconde de Pirajá', 750, 'Rio de Janeiro', 'RJ'),
('Ricardo Fernandes', '11987654322', 'ricardo@gmail.com', '01310930', 'Av. Brigadeiro Luis Antonio', 450, 'São Paulo', 'SP'),
('Amanda Oliveira', '31923456789', 'amanda_oli@hotmail.com', '30130971', 'Rua Curitiba', 123, 'Belo Horizonte', 'MG'),
('Style Trends', '11987651234', 'contato@styletrends.com', '04578923', 'Rua Augusta', 500, 'São Paulo', 'SP'),
('Luxury Fashion', '21987650987', 'suporte@luxuryfashion.com', '22250120', 'Av. Atlântica', 1500, 'Rio de Janeiro', 'RJ'),
('Gabriel Mendes', '11912345678', 'gabrielmendes@gmail.com', '01328001', 'Av. Paulista', 210, 'São Paulo', 'SP'),
('Beatriz Santos', '31911223344', 'bia_santos@gmail.com', '30130111', 'Rua Tupis', 87, 'Belo Horizonte', 'MG'),
('Ricardo Lima', '11987654399', 'ricardolima@yahoo.com', '05010030', 'Rua Turiassu', 400, 'São Paulo', 'SP'),
('Ana Clara Souza', '21944556677', 'ana.souza@gmail.com', '20231120', 'Rua do Passeio', 550, 'Recife', 'PE');

-- Inserindo Pessoa Jurídica
INSERT INTO Pessoa_Juridica (id_cliente, cnpj, razao_social)
VALUES 
(1, '12345678000195', 'Tech Solutions LTDA'),
(2, '98765432000145', 'Mega Store SA'),
(3, '56789012000178', 'Fashion Trends LTDA'),
(4, '34567890000123', 'Urban Style LTDA'),
(5, '67890123000156', 'Moda Elegante LTDA'),
(8, '21354687000177', 'Style Trends LTDA'),
(9, '65432189000188', 'Luxury Fashion SA');

-- Inserindo Pessoa Física
INSERT INTO Pessoa_Fisica (id_cliente, cpf)
VALUES 
(6, '12345678900'),
(7, '98765432100'),
(10, '33322211100'),
(11, '44455566699'),
(12, '77788899955'),
(13, '66655544433');


-- Inserindo Funcionários
INSERT INTO Funcionarios (nome, cpf, carga_horaria, salario, data_admissao)
VALUES 
('Carlos Oliveira', '11122233344', 40, 3000.00, '2024-01-15'),
('Mariana Souza', '55566677788', 44, 4500.00, '2023-10-20'),
('Roberto Lima', '99988877766', 40, 2500.00, '2024-02-05'), 
('Fernanda Lima', '32165498722', 44, 5000.00, '2023-08-10'),
('Gustavo Martins', '65498732155', 40, 3200.00, '2023-11-25'),
('Isabela Rocha', '78912345699', 40, 2800.00, '2024-01-05'),
('Lucas Almeida', '98732165433', 44, 4500.00, '2023-07-15'),
('Paulo Cesar', '15935748622', 40, 4200.00, '2024-02-01'),
('Juliana Alves', '75395145633', 44, 4800.00, '2023-09-18'),
('Matheus Costa', '85274196311', 40, 3100.00, '2024-03-10'),
('Camila Ferreira', '14725836900', 44, 5000.00, '2023-06-22'),
('Diego Martins', '36985214777', 40, 3500.00, '2023-11-05'),
('Rafaela Nunes', '95175385244', 44, 5200.00, '2023-07-30');

-- Inserindo Vendedores
INSERT INTO Vendedor (matricula, meta_vendas, porcentagem_comissao)
VALUES 
(1, 50000.00, 5.00),
(2, 60000.00, 4.50),
(4, 70000.00, 5.50),
(5, 55000.00, 4.75),
(8, 75000.00, 6.00),
(9, 62000.00, 5.25),
(10, 67000.00, 5.75);

-- Inserindo Repositores
INSERT INTO Repositor (matricula, setor_estoque)
VALUES 
(3, 'Moda e Vestuário'),
(6, 'Roupas Casuais'),
(7, 'Calçados e Acessórios'),
(11, 'Acessórios'),
(12, 'Moda Esportiva');

-- Inserindo Produtos com estoque inicial zero
INSERT INTO Produtos (cod_barras, nome, marca, preco, descricao)
VALUES 
('7891234560012', 'Calça Jeans Slim', 'Levis', 199.90, 'Calça jeans azul slim fit'),
('7891234560029', 'Camisa Polo', 'Lacoste', 299.90, 'Camisa polo verde com logo'),
('7891234560036', 'Tênis Esportivo', 'Nike', 399.90, 'Tênis para corrida leve e confortável'),
('7891234560043', 'Camisa de Couro', 'Gucci', 1200.00, 'Camisa estilizada de couro legítimo, preta'),
('7891234560050', 'Camisa Longa Estampada', 'Zara', 350.00, 'Camisa feminina longa com estampa floral, ideal para o verão'),
('7891234560067', 'Sapato Social', 'Prada', 850.00, 'Sapato social masculino preto de couro legítimo'),
('7891234560074', 'Bota de Couro', 'Chanel', 2200.00, 'Bota feminina premium, cor preta, ideal para inverno'),
('7891234560081', 'Camisa Social Slim', 'Armani', 850.00, 'Camisa slim fit preta para ocasiões formais'),
('7891234560098', 'Camisa Midi Estampada', 'Dior', 600.00, 'Camisa midi azul com estampa floral, moderna e versátil'),
('7891234560104', 'Tênis Casual Unissex', 'Adidas', 350.00, 'Tênis confortável para uso diário, estilo moderno'),
('7891234560111', 'Camisa de Inverno', 'Burberry', 700.00, 'Camisa de lã para dias frios, confortável e elegante'),
('7891234560128', 'Calça Social Completa', 'Hugo Boss', 1200.00, 'Calça social preta slim fit, sofisticada para eventos formais'),
('7891234560135', 'Calça Moletom Unissex', 'Nike', 250.00, 'Calça moletom cinza com ajuste confortável e estiloso');

-- Inserindo Produto_Tamanho com estoque inicial zero (Trigger atualizar_estoque)
INSERT INTO Produto_Tamanho (cod_barras, especificacao, qtd_estoque)
VALUES 
('7891234560012', '38', 0),
('7891234560012', '40', 0),
('7891234560012', '42', 0),
('7891234560029', 'P', 0),
('7891234560029', 'M', 0),
('7891234560029', 'G', 0),
('7891234560036', '39', 0),
('7891234560036', '40', 0),
('7891234560036', '42', 0),
('7891234560043', 'P', 0),
('7891234560043', 'M', 0),
('7891234560043', 'G', 0),
('7891234560050', 'P', 0),
('7891234560050', 'M', 0),
('7891234560050', 'G', 0),
('7891234560067', '38', 0),
('7891234560067', '40', 0),
('7891234560067', '42', 0),
('7891234560074', '34', 0),
('7891234560074', '36', 0),
('7891234560074', '38', 0),
('7891234560081', 'P', 0),
('7891234560081', 'M', 0),
('7891234560081', 'G', 0),
('7891234560098', 'P', 0),
('7891234560098', 'M', 0),
('7891234560098', 'G', 0),
('7891234560104', '38', 0),
('7891234560104', '40', 0),
('7891234560104', '42', 0),
('7891234560111', 'P', 0),
('7891234560111', 'M', 0),
('7891234560111', 'G', 0),
('7891234560128', '46', 0),
('7891234560128', '48', 0),
('7891234560128', '50', 0),
('7891234560135', 'P', 0),
('7891234560135', 'M', 0),
('7891234560135', 'G', 0);

-- Inserindo Fornecedores
INSERT INTO Fornecedor (cnpj, email, telefone, razao_social)
VALUES 
('11122233000199', 'fornecedor1@roupas.com', '11999998888', 'Fornecedor de Roupas LTDA'),
('33344455000177', 'fornecedor2@calcados.com', '11988887777', 'Fornecedor de Calçados S.A'),
('55566677000111', 'suporte@modapremium.com', '11955556666', 'Moda Premium Distribuidora LTDA'),
('77788899000122', 'contato@fashionlux.com', '21987654321', 'Fashion Lux Comércio de Roupas SA'),
('88877766000133', 'contato@elegancefashion.com', '21987651234', 'Elegance Fashion Distribuidora LTDA'),
('55544433000122', 'suporte@globalstyle.com', '31988776655', 'Global Style Comércio Internacional SA');

-- Inserindo Fornecedor_Produto para adicionar ao estoque
INSERT INTO Fornecedor_Produto (cnpj, cod_barras, quantidade, especificacao)
VALUES 
('11122233000199', '7891234560012', 50, '38'),
('11122233000199', '7891234560012', 30, '40'),
('11122233000199', '7891234560012', 20, '42'),
('11122233000199', '7891234560029', 40, 'P'),
('11122233000199', '7891234560029', 20, 'M'),
('33344455000177', '7891234560036', 25, '39'),
('33344455000177', '7891234560036', 35, '40'),
('33344455000177', '7891234560036', 30, '42'),
('55566677000111', '7891234560043', 25, 'P'),
('55566677000111', '7891234560043', 30, 'M'),
('55566677000111', '7891234560043', 20, 'G'),
('55566677000111', '7891234560050', 40, 'P'),
('55566677000111', '7891234560050', 35, 'M'),
('55566677000111', '7891234560050', 25, 'G'),
('77788899000122', '7891234560067', 20, '38'),
('77788899000122', '7891234560067', 25, '40'),
('77788899000122', '7891234560067', 30, '42'),
('77788899000122', '7891234560074', 15, '34'),
('77788899000122', '7891234560074', 20, '36'),
('77788899000122', '7891234560074', 25, '38'),
('88877766000133', '7891234560081', 20, 'P'),
('88877766000133', '7891234560081', 25, 'M'),
('88877766000133', '7891234560081', 30, 'G'),
('88877766000133', '7891234560098', 30, 'P'),
('88877766000133', '7891234560098', 35, 'M'),
('88877766000133', '7891234560098', 40, 'G'),
('55544433000122', '7891234560104', 40, '38'),
('55544433000122', '7891234560104', 45, '40'),
('55544433000122', '7891234560104', 50, '42'),
('55544433000122', '7891234560111', 20, 'P'),
('55544433000122', '7891234560111', 30, 'M'),
('55544433000122', '7891234560111', 40, 'G'),
('55544433000122', '7891234560128', 10, '46'),
('55544433000122', '7891234560128', 15, '48'),
('55544433000122', '7891234560128', 20, '50'),
('88877766000133', '7891234560135', 25, 'P'),
('88877766000133', '7891234560135', 20, 'M'),
('88877766000133', '7891234560135', 30, 'G');

-- Inserindo Vendas
INSERT INTO Vendas (matr_vendedor, id_cliente, forma_pagto)
VALUES 
(1, 1, 'Cartão de Crédito'),
(2, 2, 'Pix'),
(4, 4, 'Cartão de Débito'),
(5, 5, 'Boleto Bancário'),
(1, 6, 'Pix'),
(2, 7, 'Dinheiro'),
(8, 8, 'Cartão de Crédito'),
(9, 9, 'Transferência Bancária'),
(10, 10, 'Boleto Bancário'),
(8, 11, 'Pix'),
(9, 12, 'Dinheiro'),
(10, 13, 'Cartão de Débito'),
(8, 1, 'Cartão de Crédito'),
(9, 2, 'Pix'),
(10, 3, 'Boleto Bancário'),
(8, 4, 'Dinheiro'),
(9, 5, 'Cartão de Débito'),
(10, 6, 'Transferência Bancária'),
(8, 7, 'Pix'),
(9, 8, 'Cartão de Crédito'),
(10, 9, 'Boleto Bancário'),
(8, 10, 'Dinheiro'),
(9, 11, 'Cartão de Débito'),
(10, 12, 'Pix'),
(8, 13, 'Transferência Bancária'),
(9, 1, 'Cartão de Crédito'),
(10, 2, 'Dinheiro');

-- Inserindo Vendas_Produto
INSERT INTO Vendas_Produto (nota_fiscal, cod_barras, quantidade, especificacao)
VALUES 
(1, '7891234560012', 2, '38'),
(1, '7891234560036', 1, '40'),
(2, '7891234560029', 1, 'P'),
(3, '7891234560043', 1, 'P'),
(3, '7891234560067', 1, '40'),
(4, '7891234560050', 2, 'M'),
(4, '7891234560074', 1, '36'),
(5, '7891234560012', 1, '40'),
(5, '7891234560029', 1, 'M'),
(6, '7891234560036', 1, '42'),
(7, '7891234560081', 1, 'P'),
(7, '7891234560104', 2, '38'),
(8, '7891234560098', 1, 'P'),
(8, '7891234560111', 1, 'M'),
(9, '7891234560128', 1, '48'),
(9, '7891234560135', 2, 'M'),
(10, '7891234560104', 1, '40'),
(11, '7891234560081', 1, 'M'),
(12, '7891234560098', 2, 'M'),
(13, '7891234560135', 1, 'G'),
(14, '7891234560012', 1, '40'),
(14, '7891234560036', 2, '40'),
(15, '7891234560029', 1, 'P'),
(15, '7891234560043', 1, 'M'),
(16, '7891234560081', 1, 'M'),
(16, '7891234560104', 2, '42'),
(17, '7891234560128', 1, '48'),
(17, '7891234560098', 1, 'P'),
(18, '7891234560135', 2, 'M'),
(18, '7891234560012', 1, '42'),
(19, '7891234560036', 1, '40'),
(19, '7891234560098', 1, 'M'),
(20, '7891234560128', 1, '50'),
(20, '7891234560135', 1, 'G'),
(21, '7891234560081', 1, 'G'),
(21, '7891234560098', 2, 'M'),
(22, '7891234560135', 1, 'G'),
(22, '7891234560104', 2, '40'),
(23, '7891234560012', 1, '38'),
(23, '7891234560029', 2, 'P'),
(24, '7891234560043', 1, 'M'),
(24, '7891234560081', 1, 'M'),
(25, '7891234560135', 1, 'M'),
(25, '7891234560036', 2, '42'),
(26, '7891234560128', 1, '46'),
(26, '7891234560098', 1, 'M'),
(27, '7891234560081', 1, 'G'),
(27, '7891234560104', 2, '40'),
(27, '7891234560135', 1, 'M'),
(27, '7891234560012', 1, '40'),
(27, '7891234560029', 1, 'P'),
(27, '7891234560098', 1, 'M');

-- Inserindo dados na tabela Calca
INSERT INTO Calca (cod_barras, estilo, genero, tecido)
VALUES
('7891234560012', 'Slim Fit', 'Masculino', 'Jeans'),
('7891234560128', 'Social', 'Masculino', 'Lã'),
('7891234560135', 'Casual', 'Unissex', 'Algodão');

-- Inserindo dados na tabela Camisa
INSERT INTO Camisa (cod_barras, estilo, genero, tecido)
VALUES
('7891234560029', 'Polo', 'Masculino', 'Algodão'),
('7891234560043', 'Casual', 'Masculino', 'Couro'),
('7891234560050', 'Longa', 'Feminino', 'Viscose'),
('7891234560081', 'Social', 'Masculino', 'Poliéster'),
('7891234560098', 'Estampada', 'Feminino', 'Seda'),
('7891234560111', 'Inverno', 'Unissex', 'Lã');

-- Inserindo dados na tabela Calcado
INSERT INTO Calcado (cod_barras, tipo, genero, cor)
VALUES
('7891234560036', 'Esportivo', 'Masculino', 'Branco'),
('7891234560067', 'Social', 'Masculino', 'Preto'),
('7891234560074', 'Bota', 'Feminino', 'Preto'),
('7891234560104', 'Casual', 'Unissex', 'Cinza');

-- Inserindo dados na tabela Calcado_Material
INSERT INTO Calcado_Material (cod_barras, material)
VALUES
('7891234560036', 'Malha'),
('7891234560036', 'Borracha'),
('7891234560067', 'Couro'),
('7891234560067', 'Borracha'),
('7891234560074', 'Couro'),
('7891234560074', 'Borracha'),
('7891234560104', 'Sintético'),
('7891234560104', 'Borracha');
