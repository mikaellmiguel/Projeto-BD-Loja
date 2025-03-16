import { Link, useLocation } from 'react-router-dom';
import { Home, Users, UserCircle, Package, ShoppingCart } from 'lucide-react';

const Navbar = () => {
  const location = useLocation();
  
  const isActive = (path: string) => {
    return location.pathname === path ? 'bg-blue-700' : '';
  };

  return (
    <nav className="bg-blue-600 text-white shadow-lg">
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-between h-16">
          <div className="flex space-x-4">
            <Link to="/" className={`flex items-center px-3 py-2 rounded-md text-sm font-medium ${isActive('/')}`}>
              <Home className="w-5 h-5 mr-1" />
              Início
            </Link>
            <Link to="/clients" className={`flex items-center px-3 py-2 rounded-md text-sm font-medium ${isActive('/clients')}`}>
              <Users className="w-5 h-5 mr-1" />
              Clientes
            </Link>
            <Link to="/employees" className={`flex items-center px-3 py-2 rounded-md text-sm font-medium ${isActive('/employees')}`}>
              <UserCircle className="w-5 h-5 mr-1" />
              Funcionários
            </Link>
            <Link to="/products" className={`flex items-center px-3 py-2 rounded-md text-sm font-medium ${isActive('/products')}`}>
              <Package className="w-5 h-5 mr-1" />
              Produtos
            </Link>
            <Link to="/sales" className={`flex items-center px-3 py-2 rounded-md text-sm font-medium ${isActive('/sales')}`}>
              <ShoppingCart className="w-5 h-5 mr-1" />
              Vendas
            </Link>
          </div>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;