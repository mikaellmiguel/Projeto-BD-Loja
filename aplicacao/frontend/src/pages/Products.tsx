import React, { useState } from 'react';
import {api} from '../services/api.ts';
import ResultTable from '../components/ResultTable';

const Products = () => {
  const [data, setData] = useState<any[] | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [price, setPrice] = useState('');
  const [barcode, setBarcode] = useState('');
  const [limit, setLimit] = useState('');
  const [size, setSize] = useState('');

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
      <h1 className="text-3xl font-bold">Gerenciamento de Produtos</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <div>
          <input
            type="number"
            value={price}
            onChange={(e) => setPrice(e.target.value)}
            placeholder="Enter price"
            className="p-2 border rounded-lg w-full mb-2"
          />
          <button
            onClick={() => fetchData(`/produtos/preco/${price}`)}
            className="p-4 bg-purple-600 text-white rounded-lg hover:bg-purple-700 w-full"
          >
            Produtos acima do preço especificado
          </button>
        </div>

        <div>
          <input
            type="text"
            value={barcode}
            onChange={(e) => setBarcode(e.target.value)}
            placeholder="Enter barcode"
            className="p-2 border rounded-lg w-full mb-2"
          />
          <button
            onClick={() => fetchData(`/produtos/${barcode}/fornecedores`)}
            className="p-4 bg-purple-600 text-white rounded-lg hover:bg-purple-700 w-full"
          >
            Fornecedores dos Produtos
          </button>
        </div>

        <div>
          <input
            type="number"
            value={limit}
            onChange={(e) => setLimit(e.target.value)}
            placeholder="Enter limit"
            className="p-2 border rounded-lg w-full mb-2"
          />
          <button
            onClick={() => fetchData(`/produtos/top-vendidos/${limit}`)}
            className="p-4 bg-purple-600 text-white rounded-lg hover:bg-purple-700 w-full"
          >
            Melhores produtos em Vendas
          </button>
        </div>

        <button
          onClick={() => fetchData('/produtos/estoque')}
          className="p-4 bg-purple-600 text-white rounded-lg hover:bg-purple-700"
        >
          Produtos em Estoque
        </button>

        <div>
          <input
            type="number"
            value={size}
            onChange={(e) => setSize(e.target.value)}
            placeholder="Enter shoe size"
            className="p-2 border rounded-lg w-full mb-2"
          />
          <button
            onClick={() => fetchData(`/produtos/calcados/${size}`)}
            className="p-4 bg-purple-600 text-white rounded-lg hover:bg-purple-700 w-full"
          >
            Calçados pelo Tamanho
          </button>
        </div>

        <button
          onClick={() => fetchData('/produtos/preco-medio')}
          className="p-4 bg-purple-600 text-white rounded-lg hover:bg-purple-700"
        >
          Preço Médio
        </button>
      </div>

      <div className="mt-8">
        <ResultTable data={data} error={error} />
      </div>
    </div>
  );
};

export default Products;