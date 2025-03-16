-- Dropar Triggers
DROP TRIGGER IF EXISTS trigger_verificar_estoque ON Vendas_Produto;
DROP TRIGGER IF EXISTS trigger_atualizar_estoque ON Vendas_Produto;
DROP TRIGGER IF EXISTS trigger_atualizar_estoque_fornecedor ON Fornecedor_Produto;

-- Dropar Funções
DROP FUNCTION IF EXISTS verificar_estoque CASCADE;
DROP FUNCTION IF EXISTS atualizar_estoque CASCADE;
DROP FUNCTION IF EXISTS atualizar_estoque_fornecedor CASCADE;

-- Dropar Views
DROP VIEW IF EXISTS view_venda_valor CASCADE;

-- Dropar Tabelas Dependentes
DROP TABLE IF EXISTS Vendas_Produto CASCADE;
DROP TABLE IF EXISTS Produto_Tamanho CASCADE;
DROP TABLE IF EXISTS Calcado_Material CASCADE;
DROP TABLE IF EXISTS Calcado CASCADE;
DROP TABLE IF EXISTS Camisa CASCADE;
DROP TABLE IF EXISTS Calca CASCADE;
DROP TABLE IF EXISTS Fornecedor_Produto CASCADE;
DROP TABLE IF EXISTS Fornecedor CASCADE;
DROP TABLE IF EXISTS Produtos CASCADE;
DROP TABLE IF EXISTS Vendas CASCADE;
DROP TABLE IF EXISTS Repositor CASCADE;
DROP TABLE IF EXISTS Vendedor CASCADE;
DROP TABLE IF EXISTS Funcionarios CASCADE;
DROP TABLE IF EXISTS Pessoa_Fisica CASCADE;
DROP TABLE IF EXISTS Pessoa_Juridica CASCADE;
DROP TABLE IF EXISTS Clientes CASCADE;

-- Dropar Domínios
DROP DOMAIN IF EXISTS genero_domain CASCADE;
