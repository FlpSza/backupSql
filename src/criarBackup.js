const { Client } = require('pg');
const { exec } = require('child_process');
const util = require('util');
const moment = require('moment'); // Importar a biblioteca moment
const execAsync = util.promisify(exec);
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

    // Formatar a data atual usando moment.js
    const dataHoraAtual = moment().format('DD-MM-YY_HH-mm-ss');
    
    // Construir o caminho de backup com o nome do arquivo contendo a data e hora
    const caminhoBackup = `C:/Users/Fellipe Silva/OneDrive/Área de Trabalho/gerarbackup/backup_${dataHoraAtual}.sql`;

    const comandoBackup = `"C:/Program Files/PostgreSQL/15/bin/pg_dump.exe" -Ft --no-owner --dbname=postgresql://${client.user}:${client.password}@${client.host}:${client.port}/${client.database} > "${caminhoBackup}"`;

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
};
