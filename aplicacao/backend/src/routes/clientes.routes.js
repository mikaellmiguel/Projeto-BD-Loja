const {Router} = require('express');
const {getClientes, getClientesPorEstado, getHistoricoVendasCliente, getTotalClientes, getTicketMedioClientes} = require('../database/consultas');

const clientesRouter = Router();


clientesRouter.get('/total', async (request, response) => {
    const data = await getTotalClientes();
    response.json(data);
});


clientesRouter.get('/ticket-medio', async (request, response) => {
    const data = await getTicketMedioClientes();
    response.json(data);
});

clientesRouter.get('/', async (request, response) => {
    const data = await getClientes();
    response.json(data);
});

clientesRouter.get('/:estado', async (request, response) => {
    const {estado} = request.params;
    const data = await getClientesPorEstado(estado);
    response.json(data);
});

clientesRouter.get('/:id/vendas', async (request, response) => {
    const {id} = request.params;
    const data = await getHistoricoVendasCliente(id);
    response.json(data);
});


module.exports = clientesRouter;

