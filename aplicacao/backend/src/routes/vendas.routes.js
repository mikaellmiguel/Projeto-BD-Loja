const { Router } = require('express');

const {
    getDistinctFormasPagamento,
    getProdutosVendidosOrdenadosNotaFiscal,
    getTotalVendas,
    getTicketMedioPorFormaPagamento,
    getRelatorioVendas
} = require('../database/consultas');

const vendasRouter = Router();

vendasRouter.get('/formas-pagamento', async (req, res) => {
    const data = await getDistinctFormasPagamento();
    res.json(data);
});

vendasRouter.get('/', async (req, res) => {
    const data = await getProdutosVendidosOrdenadosNotaFiscal();
    res.json(data);
});

vendasRouter.get('/total', async (req, res) => {
    const data = await getTotalVendas();
    res.json(data);
});

vendasRouter.get('/ticket-medio', async (req, res) => {
    const data = await getTicketMedioPorFormaPagamento();
    res.json(data);
});

vendasRouter.get('/relatorio', async (req, res) => {
    const data = await getRelatorioVendas();
    res.json(data);
});

module.exports = vendasRouter;