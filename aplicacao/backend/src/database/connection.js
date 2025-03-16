const { Pool } = require('pg');
require('dotenv').config(); // Se quiser usar variáveis de ambiente

const pool = new Pool({
  user: process.env.DB_USER || 'seu_usuario',
  host: process.env.DB_HOST || 'localhost',
  database: process.env.DB_NAME || 'seu_banco',
  password: process.env.DB_PASSWORD || 'sua_senha',
  port: process.env.DB_PORT || 5432,
});

pool.connect()
  .then(() => console.log('Conectado ao PostgreSQL!'))
  .catch(err => console.error('Erro ao conectar:', err));

module.exports = pool;
