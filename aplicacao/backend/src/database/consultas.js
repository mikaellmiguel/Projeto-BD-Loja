const pool = require('./connection');

async function getClientes() {
    const { rows } = await pool.query('SELECT * FROM Clientes');
    return rows;
}

async function getFuncionarios() {
    const { rows } = await pool.query('SELECT nome, salario, carga_horaria FROM Funcionarios');
    return rows;
}

async function getDistinctFormasPagamento() {
    const { rows } = await pool.query('SELECT DISTINCT forma_pagto FROM Vendas');
    return rows;
}

async function getProdutosPrecoMaiorQue(valor) {
    const { rows } = await pool.query('SELECT nome, marca, preco FROM Produtos WHERE preco > $1', [valor]);
    return rows;
}

async function getClientesPorEstado(estado) {
    const { rows } = await pool.query("SELECT nome, telefone, rua, cidade FROM Clientes WHERE estado = $1", [estado]);
    return rows;
}

async function getClientesPorDominioEmail(dominio) {
    const { rows } = await pool.query("SELECT * FROM Clientes WHERE email LIKE $1", [`%${dominio}`]);
    return rows;
}

async function getHistoricoVendasCliente(idCliente) {
    const { rows } = await pool.query('SELECT * FROM view_venda_valor WHERE id_cliente = $1', [idCliente]);
    return rows;
}

async function getProdutosVendidosOrdenadosNotaFiscal() {
    const { rows } = await pool.query('SELECT * FROM view_venda_valor ORDER BY nota_fiscal');
    return rows;
}

async function getTotalClientes() {
    const { rows } = await pool.query('SELECT COUNT(*) AS total_clientes FROM Clientes');
    return rows;
}

async function getTotalVendas() {
    const { rows } = await pool.query('SELECT SUM(valor_total) AS total_vendas FROM view_venda_valor');
    return rows;
}

async function getPrecoMedioProdutos() {
    const { rows } = await pool.query('SELECT ROUND(AVG(preco), 2) AS preco_medio FROM Produtos');
    return rows;
}

async function getMaiorMenorSalario() {
    const { rows } = await pool.query('SELECT MAX(salario) AS maior_salario, MIN(salario) AS menor_salario FROM Funcionarios');
    return rows;
}

async function getFornecedoresPorProduto(codBarras) {
    const { rows } = await pool.query(`
        SELECT DISTINCT F.* FROM Fornecedor F
        JOIN Fornecedor_Produto FP ON F.cnpj = FP.cnpj
        WHERE FP.cod_barras = $1
    `, [codBarras]);
    return rows;
}

async function getTopProdutosMaisVendidos(limit) {
    const { rows } = await pool.query(`
        SELECT VP.cod_barras, P.nome, SUM(VP.quantidade) AS total_vendido
        FROM Vendas_Produto VP
        JOIN Produtos P ON VP.cod_barras = P.cod_barras
        GROUP BY VP.cod_barras, P.nome
        ORDER BY total_vendido DESC
        LIMIT $1
    `, [limit]);
    return rows;
}

async function getClientesComComprasAcimaDe(valorMinimo) {
    const { rows } = await pool.query(`
        SELECT V.id_cliente, COUNT(V.nota_fiscal) AS total_vendas, SUM(VP.quantidade * P.preco) AS valor_total
        FROM view_venda_valor V
        JOIN Vendas_Produto VP ON V.nota_fiscal = VP.nota_fiscal
        JOIN Produtos P ON VP.cod_barras = P.cod_barras
        GROUP BY V.id_cliente
        HAVING SUM(VP.quantidade * P.preco) > $1
    `, [valorMinimo]);
    return rows;
}

async function getProdutosComEstoque() {
    const { rows } = await pool.query(`
        SELECT P.*, PT.qtd_estoque, PT.especificacao
        FROM Produtos P
        JOIN Produto_Tamanho PT ON P.cod_barras = PT.cod_barras
        WHERE PT.qtd_estoque > 0
    `);
    return rows;
}

async function getCalcadosPorNumeracao(numeracao) {
    const { rows } = await pool.query(`
        SELECT P.*, PT.qtd_estoque
        FROM Produtos P
        JOIN Produto_Tamanho PT ON P.cod_barras = PT.cod_barras
        JOIN Calcado C ON P.cod_barras = C.cod_barras
        WHERE PT.especificacao = $1 AND PT.qtd_estoque > 0
    `, [numeracao]);
    return rows;
}

async function getTicketMedioClientes() {
    const { rows } = await pool.query(`
        SELECT C.id_cliente, C.nome, 
                COUNT(V.nota_fiscal) AS total_compras,
                ROUND(AVG(VV.valor_total), 2) AS ticket_medio
        FROM Clientes C
        LEFT JOIN Vendas V ON C.id_cliente = V.id_cliente
        LEFT JOIN view_venda_valor VV ON V.nota_fiscal = VV.nota_fiscal
        GROUP BY C.id_cliente, C.nome
        ORDER BY ticket_medio DESC
    `);
   return rows;
}

async function getTicketMedioPorFormaPagamento() {
    const { rows } = await pool.query(`
        SELECT forma_pagto, COUNT(*) AS total_vendas, ROUND(AVG(valor_total), 2) AS ticket_medio
        FROM view_venda_valor
        GROUP BY forma_pagto
        ORDER BY ticket_medio DESC
    `);
    return rows;
}

async function getRelatorioDesempenhoVendedores() {
    const { rows } = await pool.query(`
        SELECT f.matricula, f.nome AS vendedor, COUNT(v.nota_fiscal) AS total_vendas, 
               SUM(v.valor_total) AS faturamento, vnd.porcentagem_comissao, 
               ROUND(SUM(v.valor_total * (vnd.porcentagem_comissao / 100)), 2) AS comissao_total
        FROM view_venda_valor v
        JOIN Funcionarios f ON v.matr_vendedor = f.matricula
        JOIN Vendedor vnd ON f.matricula = vnd.matricula
        GROUP BY f.matricula, f.nome, vnd.porcentagem_comissao
        ORDER BY faturamento DESC
    `);
    return rows;
}

async function getRelatorioVendas() {
    const { rows } = await pool.query(`
        SELECT v.nota_fiscal, c.nome AS cliente, f.nome AS vendedor, p.nome AS produto, 
               vp.quantidade, vp.especificacao, p.preco AS preco_unitario, 
               (vp.quantidade * p.preco) AS valor_total, v.forma_pagto, v.data_hora
        FROM view_venda_valor v
        LEFT JOIN Clientes c ON v.id_cliente = c.id_cliente
        LEFT JOIN Funcionarios f ON v.matr_vendedor = f.matricula
        JOIN Vendas_Produto vp ON v.nota_fiscal = vp.nota_fiscal
        JOIN Produtos p ON vp.cod_barras = p.cod_barras
        ORDER BY v.data_hora DESC
    `);
    return rows;
}

module.exports = {
    getClientes,
    getFuncionarios,
    getDistinctFormasPagamento,
    getProdutosPrecoMaiorQue,
    getClientesPorEstado,
    getClientesPorDominioEmail,
    getHistoricoVendasCliente,
    getProdutosVendidosOrdenadosNotaFiscal,
    getTotalClientes,
    getTotalVendas,
    getPrecoMedioProdutos,
    getMaiorMenorSalario,
    getFornecedoresPorProduto,
    getTopProdutosMaisVendidos,
    getClientesComComprasAcimaDe,
    getProdutosComEstoque,
    getCalcadosPorNumeracao,
    getTicketMedioClientes,
    getTicketMedioPorFormaPagamento,
    getRelatorioDesempenhoVendedores,
    getRelatorioVendas,
};
