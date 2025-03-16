/* eslint-disable @typescript-eslint/no-explicit-any */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { useState } from 'react';
import {api} from '../services/api.ts';
import ResultTable from '../components/ResultTable';

const Employees = () => {
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
      <h1 className="text-3xl font-bold">Gerenciamento de Funcionários</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <button
          onClick={() => fetchData('/funcionarios')}
          className="p-4 bg-green-600 text-white rounded-lg hover:bg-green-700"
        >
          Listar todos os funcionários
        </button>

        <button
          onClick={() => fetchData('/funcionarios/salarios')}
          className="p-4 bg-green-600 text-white rounded-lg hover:bg-green-700"
        >
          Salário Report
        </button>

        <button
          onClick={() => fetchData('/funcionarios/desempenho')}
          className="p-4 bg-green-600 text-white rounded-lg hover:bg-green-700"
        >
          Desempenho Vendedores
        </button>
      </div>

      <div className="mt-8">
        <ResultTable data={data} error={error} />
      </div>
    </div>
  );
};

export default Employees;