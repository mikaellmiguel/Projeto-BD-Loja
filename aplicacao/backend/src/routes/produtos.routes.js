const {Router} = require('express');

const {
    getProdutosPrecoMaiorQue,
    getFornecedoresPorProduto,
    getTopProdutosMaisVendidos,
    getProdutosComEstoque,
    getCalcadosPorNumeracao,
    getPrecoMedioProdutos
} = require('../database/consultas');

const produtosRouter = Router();

produtosRouter.get('/preco/:valor', async (req, res) => {
    const { valor } = req.params;
    const data = await getProdutosPrecoMaiorQue(valor);
    res.json(data);
});

produtosRouter.get('/:codBarras/fornecedores', async (req, res) => {
    const { codBarras } = req.params;
    const data = await getFornecedoresPorProduto(codBarras);
    res.json(data);
});

produtosRouter.get('/top-vendidos/:limit', async (req, res) => {
    const { limit } = req.params;
    const data = await getTopProdutosMaisVendidos(limit);
    res.json(data);
});

produtosRouter.get('/estoque', async (req, res) => {
    const data = await getProdutosComEstoque();
    res.json(data);
});

produtosRouter.get('/calcados/:numeracao', async (req, res) => {
    const { numeracao } = req.params;
    const data = await getCalcadosPorNumeracao(numeracao);
    res.json(data);
});

produtosRouter.get('/preco-medio', async (req, res) => {
    const data = await getPrecoMedioProdutos();
    res.json(data);
});

module.exports = produtosRouter;