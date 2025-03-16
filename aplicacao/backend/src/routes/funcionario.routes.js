const { Router } = require('express');

const {
    getFuncionarios,
    getMaiorMenorSalario,
    getRelatorioDesempenhoVendedores
} = require('../database/consultas');

const funcionariosRouter = Router();

funcionariosRouter.get('/', async (req, res) => {
    const data = await getFuncionarios();
    res.json(data);
});

funcionariosRouter.get('/salarios', async (req, res) => {
    const data = await getMaiorMenorSalario();
    res.json(data);
});

funcionariosRouter.get('/desempenho', async (req, res) => {
    const data = await getRelatorioDesempenhoVendedores();
    res.json(data);
});

module.exports = funcionariosRouter;