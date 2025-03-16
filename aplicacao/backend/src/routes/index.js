const {Router} = require('express');
const clientesRouter = require('./clientes.routes');
const funcionariosRouter = require('./funcionario.routes');
const produtosRouter = require('./produtos.routes');
const vendasRouter = require('./vendas.routes');

const router = Router();
router.use('/clientes', clientesRouter);
router.use('/funcionarios', funcionariosRouter);
router.use('/produtos', produtosRouter);
router.use('/vendas', vendasRouter);

module.exports = router;