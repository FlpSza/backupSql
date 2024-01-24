const { Client } = require('pg');
const { exec } = require('child_process');
const util = require('util');
const moment = require('moment'); // Importar a biblioteca moment
const execAsync = util.promisify(exec);
require('dotenv').config();

async function realizarBackup() {
  const client = new Client({
    user: process.env.USER,
    host: process.env.HOST,
    database: process.env.DATABASE,
    password: process.env.PASSWORD,
    port: process.env.PORT,
  });

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

async function verificarAgendamentoExistente(dia) {
  const client = new Client({
    user: process.env.USER,
    host: process.env.HOST,
    database: process.env.DATABASE,
    password: process.env.PASSWORD,
    port: process.env.PORT,
  });

  try {
    // Conectar ao PostgreSQL
    await client.connect();

    const query = 'SELECT * FROM agendamentos WHERE dia = $1 LIMIT 1';
    const values = [dia];

    const result = await client.query(query, values);
    return result.rows[0];
  } catch (err) {
    console.error('Erro ao verificar agendamento existente:', err);
    return null;
  } finally {
    await client.end();
  }
}

async function cancelarAgendamentoNoBanco(agendamentoId) {
  const client = new Client({
    user: process.env.USER,
    host: process.env.HOST,
    database: process.env.DATABASE,
    password: process.env.PASSWORD,
    port: process.env.PORT,
  });

  try {
    // Conectar ao PostgreSQL
    await client.connect();

    const query = 'DELETE FROM agendamentos WHERE id = $1';
    const values = [agendamentoId];

    await client.query(query, values);
    console.log('Agendamento existente cancelado com sucesso.');
  } catch (err) {
    console.error('Erro ao cancelar agendamento existente:', err);
  } finally {
    await client.end();
  }
}

module.exports = {
  realizarBackup,
  verificarAgendamentoExistente,
  cancelarAgendamentoNoBanco,
};
