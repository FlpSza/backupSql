// src/main.js
const { ipcMain, app, BrowserWindow } = require('electron');
const path = require('path');
const schedule = require('node-schedule');
const { realizarBackup, cancelarAgendamentoNoBanco, verificarAgendamentoExistente } = require('./criarBackup');
const fs = require('fs');
const { Client } = require('pg');
const moment = require('moment');

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
let tarefaAgendada;

function criarJanelaConfiguracoesBanco() {
    const configuracoesBancoWindow = new BrowserWindow({
        width: 600,
        height: 400,
        webPreferences: {
            preload: path.join(__dirname, 'preload.js')
        }
    });

    configuracoesBancoWindow.loadFile(path.join(__dirname, '../visual/configuraçoes.html'));

    configuracoesBancoWindow.on('closed', () => {
        // Lidar com o fechamento da janela, se necessário
    });
}

function createWindow() {
    mainWindow = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            preload: path.join(__dirname, 'preload.js')
        }
    });

    mainWindow.loadFile(path.join(__dirname, '../visual/index.html'));

    // Abra o DevTools apenas durante o desenvolvimento
    if (process.env.NODE_ENV === 'development') {
        mainWindow.webContents.openDevTools();
    }

    mainWindow.on('closed', () => {
        mainWindow = null;
    });
}

function criarAgendamento(configuracoes) {
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

    // Verificar se existe um agendamento para o mesmo dia da semana
    client.connect();
    const query = 'SELECT * FROM agendamentos WHERE dia = $1 LIMIT 1';
    const values = [diaSemana];

    client.query(query, values, async (err, result) => {
        if (err) {
            console.error('Erro ao verificar agendamento existente:', err);
        } else {
            // Se existir, cancelar o agendamento existente
            if (result.rows.length > 0) {
                await cancelarAgendamentoNoBanco(result.rows[0].id);
            }

            // Desconectar o cliente antes de uma nova tentativa de conexão
            client.end();

            // Criar um novo cliente para a próxima conexão
            const novoClient = new Client(dbConfig);
            novoClient.connect();

            // Insere os dados no banco de dados
            const insertQuery = 'INSERT INTO agendamentos (dia, horario) VALUES ($1, $2)';
            const insertValues = [diaSemana, horario];

            novoClient.query(insertQuery, insertValues, (insertErr) => {
                if (insertErr) {
                    console.error('Erro ao inserir dados no banco de dados:', insertErr);
                } else {
                    console.log('Dados inseridos no banco de dados com sucesso.');
                    console.log('Agendador de backup configurado para:', diaSemana, horario);
                }

                // Desconectar o novo cliente
                novoClient.end();
            });

            // Agenda a tarefa
            tarefaAgendada = schedule.scheduleJob(rule, () => {
                realizarBackup();
            });
        }
    });
}



ipcMain.on('salvar-configuracoes', (event, configuracoes) => {
    criarAgendamento(configuracoes);
    console.log('Configurações salvas:', configuracoes);
});

ipcMain.on('salvar-configuracoes-banco', (event, configuracoes) => {
    console.log('Configurações do Banco salvas:', configuracoes);

    // Crie uma string no formato chave=valor para cada configuração
    const envContent = Object.entries(configuracoes).map(([key, value]) => `${key.toUpperCase()}=${value}`).join('\n');

    // Salve a string no arquivo .env
    fs.writeFileSync(path.join(__dirname, '../.env'), envContent, 'utf-8');
});

ipcMain.on('abrir-configuracoes-banco', () => {
    criarJanelaConfiguracoesBanco();
});

app.on('ready', createWindow);

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});

app.on('activate', () => {
    if (mainWindow === null) {
        createWindow();
    }
});
