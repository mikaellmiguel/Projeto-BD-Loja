import { Link } from 'react-router-dom';
import { Users, UserCircle, Package, ShoppingCart } from 'lucide-react';

const Home = () => {
  return (
    <div className="max-w-4xl mx-auto">
      <h1 className="text-4xl font-bold text-center mb-12">Sistema de Gerenciamento da Loja</h1>
      
      <div className="grid grid-cols-2 gap-6">
        <Link to="/clients" className="p-6 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
          <div className="flex items-center mb-4">
            <Users className="w-8 h-8 text-blue-600 mr-3" />
            <h2 className="text-2xl font-semibold">Cliente</h2>
          </div>
            <p className="text-gray-600">Gerencie informações dos clientes, visualize histórico de vendas e acompanhe métricas dos clientes.</p>
        </Link>

        <Link to="/employees" className="p-6 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
          <div className="flex items-center mb-4">
            <UserCircle className="w-8 h-8 text-green-600 mr-3" />
            <h2 className="text-2xl font-semibold">Funcionários</h2>
          </div>
            <p className="text-gray-600">Acesse dados de funcionários, informações salariais e relatórios de desempenho.</p>
        </Link>

        <Link to="/products" className="p-6 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
          <div className="flex items-center mb-4">
            <Package className="w-8 h-8 text-purple-600 mr-3" />
            <h2 className="text-2xl font-semibold">Produtos</h2>
          </div>
          <p className="text-gray-600">Visualizar inventário de produtos, preços e análises de vendas.</p>
        </Link>

        <Link to="/sales" className="p-6 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
          <div className="flex items-center mb-4">
            <ShoppingCart className="w-8 h-8 text-red-600 mr-3" />
            <h2 className="text-2xl font-semibold">Vendas</h2>
          </div>
            <p className="text-gray-600">Acompanhe dados de vendas, métodos de pagamento e gere relatórios.</p>
        </Link>
      </div>
    </div>
  );
};

export default Home;