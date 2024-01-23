const { Client } = require('pg');
const { exec } = require('child_process');
const util = require('util'); // Módulo util para promisify
const execAsync = util.promisify(exec); // Converte exec para uma função que retorna uma Promise
require('dotenv').config();

const client = new Client({
  user: 'postgres',
  host: 'localhost',
  database: 'star_dev',
  password: '123456',
  port: '5432',
});

async function realizarBackup() {
  try {
    // Conectar ao PostgreSQL
    await client.connect();
    console.log('Conectado ao PostgreSQL');

    const dataHoraAtual = new Date().toISOString().replace(/[-T:]/g, '');
    const caminhoBackup = `C:/Users/Fellipe Silva/OneDrive/Área de Trabalho/gerarbackup`;

    const comandoBackup = `"C:/Program Files/PostgreSQL/15/bin/pg_dump.exe" --no-owner --dbname=postgresql://postgres:123456@localhost:5432/pdv > "C:/Users/Fellipe Silva/OneDrive/Área de Trabalho/gerarbackup/backup.sql"`;

    // Executar o comando de backup
    const { stdout, stderr } = await execAsync(comandoBackup);

    // Verificar se houve erro
    if (stderr) {
      console.error(`Erro ao realizar o backup: ${stderr}`);
    } else {
      console.log(`Backup realizado com sucesso! Salvo em: ${caminhoBackup}`);
    }
  } catch (error) {
    console.error(`Erro durante a execução do backup: ${error.message}`);
  } finally {
    // Sempre desconectar, mesmo em caso de erro
    await client.end();
    console.log('Conexão encerrada');
  }
}

module.exports = {
  realizarBackup,
}