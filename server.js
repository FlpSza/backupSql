const express = require('express');
require ('dotenv').config();
const app = express();

const port = 3000; 

app.get('/config', (req, res) => {

  res.json({
    user: process.env.USER,
    host: process.env.HOST,
    port: process.env.PORT,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
  });
});

app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});
