const { Client } = require('pg');
const { exec } = require('child_process');
const util = require('util'); // Módulo util para promisify
const execAsync = util.promisify(exec); // Converte exec para uma função que retorna uma Promise
require('dotenv').config();

const client = new Client({
  user: process.env.USER,
  host: process.env.HOST,
  database: process.env.DATABASE,
  password: process.env.PASSWORD,
  port: process.env.PORT,
});

async function realizarBackup() {
  try {
    // Conectar ao PostgreSQL
    await client.connect();
    console.log('Conectado ao PostgreSQL');

    const dataHoraAtual = new Date().toISOString().replace(/[-T:]/g, '');
    const caminhoBackup = `C:/Users/Fellipe Silva/OneDrive/Área de Trabalho/gerarbackup`;

      const comandoBackup = `"C:/Program Files/PostgreSQL/15/bin/pg_dump.exe" -Ft --no-owner --dbname=postgresql://${client.user}:${client.password}@${client.host}:${client.port}/${client.database} > "C:/Users/Fellipe Silva/OneDrive/Área de Trabalho/gerarbackup/backup.sql"`;

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