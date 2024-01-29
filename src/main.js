// src/main.js
const { ipcMain, app, BrowserWindow } = require('electron');
const path = require('path');
const schedule = require('node-schedule');
const { realizarBackup, cancelarAgendamentoNoBanco, verificarAgendamentoExistente } = require('./criarBackup');
const fs = require('fs');
const { Client } = require('pg');
const moment = require('moment');
const { spawn } = require('child_process');

require('dotenv').config();

// Configurações da conexão com o PostgreSQL
const dbConfig = {
    user: process.env.USER,
    host: process.env.HOST,
    database: process.env.DATABASE,
    password: process.env.PASSWORD,
    port: process.env.PORT,
};

const client = new Client(dbConfig);

let mainWindow;
let outraJanela;

//Abrir janela de observação de horarios agendados
ipcMain.on('abrir-outra-janela', () => {
    // Verifica se a janela já está aberta
    if (!outraJanela) {
        // Se não estiver aberta, cria uma nova janela
        outraJanela = new BrowserWindow({
            icon: './img/icon.ico',
            width: 800,
            height: 600,
            webPreferences: {
                preload: path.join(__dirname, 'preload.js')
            },
            autoHideMenuBar: true,
            title: "Gerar backup"
        });

        outraJanela.loadFile(path.join(__dirname, '../visual/agendados.html'));

        // Lidar com o fechamento da janela
        outraJanela.on('closed', () => {
        });
    }
});

//Abrir janela de configuracao do banco de dados
function criarJanelaConfiguracoesBanco() {
    const configuracoesBancoWindow = new BrowserWindow({
        icon: './img/icon.ico',
        width: 600,
        height: 400,
        webPreferences: {
            preload: path.join(__dirname, 'preload.js')
        },
        autoHideMenuBar: true,
        title: "Gerar backup"
    });

    configuracoesBancoWindow.loadFile(path.join(__dirname, '../visual/configuraçoes.html'));

    configuracoesBancoWindow.on('closed', () => {
        // Lidar com o fechamento da janela, se necessário
    });
}

//Abrir janela principal
function createWindow() {

  // Inicia o servidor Node.js/Express
  const serverProcess = spawn('node', [path.join(__dirname, 'server.js')]);

  // Redireciona a saída para o console do Electron
  serverProcess.stdout.on('data', (data) => {
    console.log(`Servidor: ${data}`);
  });

  serverProcess.stderr.on('data', (data) => {
    console.error(`Erro do servidor: ${data}`);
  });

  serverProcess.on('close', (code) => {
    console.log(`Servidor encerrado com código: ${code}`);
  });

    mainWindow = new BrowserWindow({
        icon: './img/icon.ico',
        width: 800,
        height: 600,
        webPreferences: {
            preload: path.join(__dirname, 'preload.js')
        },
        autoHideMenuBar: true,
        title: "Gerar backup"
    });

    mainWindow.loadFile(path.join(__dirname, '../visual/index.html'));

    // Abra o DevTools apenas durante o desenvolvimento
    if (process.env.NODE_ENV === 'development') {
        mainWindow.webContents.openDevTools();
    }

    mainWindow.on('closed', () => {
    });
}

//Funcao para criar agendamento no banco de dados
async function criarAgendamento(configuracoes) {
    const { diaSemana, horario } = configuracoes;

    // Mapeia o nome do dia para o número correspondente (0 para domingo, 1 para segunda, etc.)
    const diaSemanaNumerico = {
        domingo: 0,
        segunda: 1,
        terca: 2,
        quarta: 3,
        quinta: 4,
        sexta: 5,
        sabado: 6,
    }[diaSemana.toLowerCase()];

    if (diaSemanaNumerico === undefined) {
        console.error('Dia da semana inválido:', diaSemana);
        return;
    }

    // Configura o agendamento
    const rule = new schedule.RecurrenceRule();
    rule.dayOfWeek = diaSemanaNumerico;
    rule.hour = parseInt(horario.split(':')[0], 10);
    rule.minute = parseInt(horario.split(':')[1], 10);

    // Cria um novo cliente para cada agendamento
    const novoClient = new Client(dbConfig);

    try {
        // Conectar ao banco de dados
        await novoClient.connect();

        // Verificar se existe um agendamento para o mesmo dia da semana
        const query = 'SELECT * FROM agendamentos WHERE dia = $1 LIMIT 1';
        const values = [diaSemana];

        const result = await novoClient.query(query, values);

        if (result.rows.length > 0) {
            await cancelarAgendamentoNoBanco(result.rows[0].id);
        }

        // Insere os dados no banco de dados
        const insertQuery = 'INSERT INTO agendamentos (dia, horario) VALUES ($1, $2)';
        const insertValues = [diaSemana, horario];

        await novoClient.query(insertQuery, insertValues);

        console.log('Dados inseridos no banco de dados com sucesso.');
        console.log('Agendador de backup configurado para:', diaSemana, horario);

        // Agenda a tarefa
        tarefaAgendada = schedule.scheduleJob(rule, () => {
            realizarBackup();
        });
    } catch (error) {
        console.error('Erro ao criar agendamento:', error);
    } finally {
        // Certifique-se de desconectar o cliente, mesmo se ocorrer um erro
        await novoClient.end();
    }
}

// IPC para excluir o agendamento do banco de dados
ipcMain.on('excluir-agendamento', (event, { diaSemana }) => {
    // Criar um novo cliente para cada consulta
    const novoClient = new Client(dbConfig);

    // Conectar ao banco de dados
    novoClient.connect();

    // Query para excluir o agendamento para o dia selecionado
    const query = 'DELETE FROM agendamentos WHERE dia = $1';
    const values = [diaSemana];

    novoClient.query(query, values, (err) => {
        if (err) {
            console.error('Erro ao excluir o agendamento:', err);
            event.reply('agendamento-excluido', { error: 'Erro ao excluir o agendamento.' });
        } else {
            event.reply('agendamento-excluido', { success: true });
        }

        // Desconectar do banco de dados após a consulta
        novoClient.end();
    });
});

// IPC para buscar o horário agendado no banco de dados
ipcMain.on('buscar-horario-agendado', (event, diaSemana) => {
    // Criar um novo cliente para cada consulta
    const novoClient = new Client(dbConfig);

    // Conectar ao banco de dados
    novoClient.connect();

    // Query para obter o horário agendado para o dia selecionado
    const query = 'SELECT horario FROM agendamentos WHERE dia = $1 LIMIT 1';
    const values = [diaSemana];

    novoClient.query(query, values, (err, result) => {
        if (err) {
            console.error('Erro ao buscar horário agendado:', err);
            event.reply('horario-agendado', 'Erro ao buscar horário.');
        } else {
            // Enviar o horário agendado de volta para a interface do usuário
            if (result.rows.length > 0) {
                const horarioAgendado = result.rows[0].horario;
                event.reply('horario-agendado', horarioAgendado);
            } else {
                event.reply('horario-agendado', 'N/A');
            }
        }

        // Desconectar do banco de dados após a consulta
        novoClient.end();
    });
});


//Salva agendamento e envia informação para front
ipcMain.on('salvar-configuracoes', (event, configuracoes) => {
    criarAgendamento(configuracoes);
    console.log('Configurações salvas:', configuracoes);
});

//Salva dados do banco de dados no .env
ipcMain.on('salvar-configuracoes-banco', (event, configuracoes) => {
    console.log('Configurações do Banco salvas:', configuracoes);

    // Crie uma string no formato chave=valor para cada configuração
    const envContent = Object.entries(configuracoes).map(([key, value]) => `${key.toUpperCase()}=${value}`).join('\n');

    // Salve a string no arquivo .env
    fs.writeFileSync(path.join(__dirname, '../.env'), envContent, 'utf-8');
});

//Abre Janela de configurações
ipcMain.on('abrir-configuracoes-banco', () => {
    criarJanelaConfiguracoesBanco();
});

//Abre Janela Main
app.on('ready', createWindow);

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
    }
});

app.on('activate', () => {
    if (mainWindow === null) {
        createWindow();
    }
});
