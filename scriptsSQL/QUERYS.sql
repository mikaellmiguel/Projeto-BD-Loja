-- Consultas Simples
-- Listar todos os clientes cadastrados
SELECT * FROM clientes;

-- Consultas Simples
-- Listar todos os clientes cadastrados
SELECT * FROM Clientes;
-- Listar nome, salário e carga horária de todos os funcionários
SELECT nome, salario, carga_horaria FROM Funcionarios;

-- Usando o DISTINCT
-- Listar todas as formas de pagamento distintas utilizadas nas vendas
SELECT DISTINCT forma_pagto FROM Vendas;

-- Usando Filtros com WHERE
-- Listar nome, marca e preço dos produtos com preço superior a 400
SELECT nome, marca, preco FROM Produtos WHERE preco > 400;
-- Listar nome, telefone e rua dos clientes que residem em SP ou RJ
SELECT nome, telefone, rua FROM Clientes WHERE estado IN ('SP', 'RJ');
-- Listar todos os clientes que possuem email do Gmail
SELECT * FROM Clientes WHERE email LIKE '%@gmail.com';
-- Histórico de Vendas do cliente com ID = 1
SELECT * FROM Vendas WHERE id_cliente = 1;

-- Listar todos os produtos vendidos ordenados por nota fiscal
SELECT * FROM view_venda_valor ORDER BY nota_fiscal;

-- Joins e Funções Agregadoras
-- FUNÇÕES AGREGADORAS
-- Contar quantos clientes estão cadastrados
SELECT COUNT(*) AS total_clientes FROM Clientes;
-- Somar o total de vendas realizadas
SELECT SUM(valor_total) AS total_vendas FROM view_venda_valor;
-- Calcular a média de preços dos produtos
SELECT ROUND(AVG(preco), 2) AS preco_medio FROM Produtos;
-- Encontrar o maior e o menor salário dos funcionários
SELECT MAX(salario) AS maior_salario, MIN(salario) AS menor_salario FROM Funcionarios;

-- USANDO JOINS
-- Listar fornecedores para um determinado produto(7891234560012)
SELECT DISTINCT F.* 
FROM Fornecedor F
JOIN Fornecedor_Produto FP ON F.cnpj = FP.cnpj
WHERE FP.cod_barras = '7891234560012';

-- Consulta com Junção de Tabelas e Subconsulta
-- Listar matrícula, nome e CPF dos funcionários que são vendedores e que possuem total de vendas superior a 1000
SELECT F.matricula, F.nome, F.cpf, S.total_vendas
FROM Funcionarios F
JOIN Vendedor Vd ON F.matricula = Vd.matricula
JOIN (
    SELECT matr_vendedor, SUM(valor_total) AS total_vendas
    FROM view_venda_valor
    GROUP BY matr_vendedor
) S ON Vd.matricula = S.matr_vendedor
WHERE S.total_vendas > 1000;

-- Listar os 5 produtos mais vendidos
SELECT VP.cod_barras,
       P.nome,
       SUM(VP.quantidade) AS total_vendido
FROM Vendas_Produto VP
JOIN Produtos P ON VP.cod_barras = P.cod_barras
GROUP BY VP.cod_barras, P.nome
ORDER BY total_vendido DESC
LIMIT 5;

-- Listar clientes que possuem total de compras superior a 3000
SELECT V.id_cliente, 
       COUNT(V.nota_fiscal) AS total_vendas, 
       SUM(VP.quantidade * P.preco) AS valor_total
FROM view_venda_valor V
JOIN Vendas_Produto VP ON V.nota_fiscal = VP.nota_fiscal
JOIN Produtos P ON VP.cod_barras = P.cod_barras
GROUP BY V.id_cliente
HAVING SUM(VP.quantidade * P.preco) > 3000;


-- Verificar se tem algum produto com estoque disponível
SELECT P.*, PT.qtd_estoque, PT.especificacao
FROM Produtos P
JOIN Produto_Tamanho PT ON P.cod_barras = PT.cod_barras
WHERE PT.qtd_estoque > 0;

-- Verificando se tem algum calçado com a numeração 39
SELECT P.*, PT.qtd_estoque
FROM Produtos P
JOIN Produto_Tamanho PT ON P.cod_barras = PT.cod_barras
JOIN Calcado C ON P.cod_barras = C.cod_barras
WHERE PT.especificacao = '39' 
AND PT.qtd_estoque > 0;

-- CONSULTAS MAIS DETALHADAS

-- Ticket Médio de Cada Cliente
SELECT C.id_cliente, C.nome, 
       COUNT(V.nota_fiscal) AS total_compras,
       ROUND(AVG(VV.valor_total), 2) AS ticket_medio
FROM Clientes C
LEFT JOIN Vendas V ON C.id_cliente = V.id_cliente
LEFT JOIN view_venda_valor VV ON V.nota_fiscal = VV.nota_fiscal
GROUP BY C.id_cliente, C.nome;

-- Média de Ticket por forma de Pagamento
SELECT 
    forma_pagto, 
    COUNT(*) AS total_vendas, 
    ROUND(AVG(valor_total), 2) AS ticket_medio
FROM view_venda_valor
GROUP BY forma_pagto
ORDER BY ticket_medio DESC;

-- Relatório de Desempenho de Vendedores
SELECT 
    f.matricula, 
    f.nome AS vendedor, 
    COUNT(v.nota_fiscal) AS total_vendas, 
    SUM(v.valor_total) AS faturamento,
    vnd.porcentagem_comissao, 
    ROUND(SUM(v.valor_total * (vnd.porcentagem_comissao / 100)), 2) AS comissao_total
FROM view_venda_valor v
JOIN Funcionarios f ON v.matr_vendedor = f.matricula
JOIN Vendedor vnd ON f.matricula = vnd.matricula
GROUP BY f.matricula, f.nome, vnd.porcentagem_comissao
ORDER BY faturamento DESC;

-- Relatório de Vendas (Mostra todas as vendas com informações sobre clientes, vendedores e sobre produtos comprados)
SELECT 
    v.nota_fiscal, 
    c.nome AS cliente, 
    f.nome AS vendedor, 
    p.nome AS produto, 
    vp.quantidade, 
    vp.especificacao, 
    p.preco AS preco_unitario, 
    (vp.quantidade * p.preco) AS valor_total, 
    v.forma_pagto, 
    v.data_hora
FROM view_venda_valor v
LEFT JOIN Clientes c ON v.id_cliente = c.id_cliente
LEFT JOIN Funcionarios f ON v.matr_vendedor = f.matricula
JOIN Vendas_Produto vp ON v.nota_fiscal = vp.nota_fiscal
JOIN Produtos p ON vp.cod_barras = p.cod_barras
ORDER BY v.data_hora DESC;

