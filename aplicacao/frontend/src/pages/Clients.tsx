import { useState } from 'react';
import {api} from '../services/api.ts';
import ResultTable from '../components/ResultTable';

const Clients = () => {
  const [data, setData] = useState<any[] | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [state, setState] = useState('');
  const [clientId, setClientId] = useState('');

  const fetchData = async (endpoint: string) => {
    try {
      const response = await api.get(endpoint);
      setData(response.data);
      setError(null);
    } catch (err) {
      setError(`Error fetching data ${err}`);
      setData(null);
    }
  };

  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-bold">Gerenciamento de Clientes</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <button
          onClick={() => fetchData('/clientes')}
          className="p-4 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
        >
          Listar todos os Clientes
        </button>

        <div>
          <input
            type="text"
            value={state}
            onChange={(e) => setState(e.target.value)}
            placeholder="Enter state"
            className="p-2 border rounded-lg w-full mb-2"
          />
          <button
            onClick={() => fetchData(`/clientes/${state}`)}
            className="p-4 bg-blue-600 text-white rounded-lg hover:bg-blue-700 w-full"
          >
            Listar Clientes por Estado
          </button>
        </div>

        <div>
          <input
            type="text"
            value={clientId}
            onChange={(e) => setClientId(e.target.value)}
            placeholder="Enter client ID"
            className="p-2 border rounded-lg w-full mb-2"
          />
          <button
            onClick={() => fetchData(`/clientes/${clientId}/vendas`)}
            className="p-4 bg-blue-600 text-white rounded-lg hover:bg-blue-700 w-full"
          >
            Visualizar Compras do Cliente
          </button>
        </div>

        <button
          onClick={() => fetchData('/clientes/total')}
          className="p-4 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
        >
          Obter total de Clientes
        </button>

        <button
          onClick={() => fetchData('/clientes/ticket-medio')}
          className="p-4 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
        >
          Ticket Médio por Cliente
        </button>
      </div>

      <div className="mt-8">
        <ResultTable data={data} error={error} />
      </div>
    </div>
  );
};

export default Clients;