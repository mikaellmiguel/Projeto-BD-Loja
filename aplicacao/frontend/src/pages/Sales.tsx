import React, { useState } from 'react';
import {api} from '../services/api.ts';
import ResultTable from '../components/ResultTable';

const Sales = () => {
  const [data, setData] = useState<any[] | null>(null);
  const [error, setError] = useState<string | null>(null);

  const fetchData = async (endpoint: string) => {
    try {
      const response = await api.get(endpoint);
      setData(response.data);
      setError(null);
    } catch (err) {
      setError('Error fetching data');
      setData(null);
    }
  };

  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-bold">Gerenciamento de Vendas</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <button
          onClick={() => fetchData('/vendas/formas-pagamento')}
          className="p-4 bg-red-600 text-white rounded-lg hover:bg-red-700"
        >
          Métodos de Pagamento Utilizados
        </button>

        <button
          onClick={() => fetchData('/vendas')}
          className="p-4 bg-red-600 text-white rounded-lg hover:bg-red-700"
        >
          Vendas Realizadas
        </button>

        <button
          onClick={() => fetchData('/vendas/total')}
          className="p-4 bg-red-600 text-white rounded-lg hover:bg-red-700"
        >
          Vendas Total
        </button>

        <button
          onClick={() => fetchData('/vendas/ticket-medio')}
          className="p-4 bg-red-600 text-white rounded-lg hover:bg-red-700"
        >
          Ticket Médio por Método de Pagamento
        </button>

        <button
          onClick={() => fetchData('/vendas/relatorio')}
          className="p-4 bg-red-600 text-white rounded-lg hover:bg-red-700"
        >
          Relatório de Vendas
        </button>
      </div>

      <div className="mt-8">
        <ResultTable data={data} error={error} />
      </div>
    </div>
  );
};

export default Sales;