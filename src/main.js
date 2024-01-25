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
let outraJanela;

//Abrir janela de observação de horarios agendados
ipcMain.on('abrir-outra-janela', () => {
    // Verifica se a janela já está aberta
    if (!outraJanela) {
        // Se não estiver aberta, cria uma nova janela
        outraJanela = new BrowserWindow({
            width: 800,
            height: 600,
            webPreferences: {
                preload: path.join(__dirname, 'preload.js')
            }
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

//Abrir janela principal
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

//Funcao para criar agendamento no banco de dados
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

// IPC para buscar o horário agendado no banco de dados
ipcMain.on('buscar-horario-agendado', (event, diaSemana) => {
    // Conectar ao banco de dados
    client.connect();

    // Query para obter o horário agendado para o dia selecionado
    const query = 'SELECT horario FROM agendamentos WHERE dia = $1 LIMIT 1';
    const values = [diaSemana];

    client.query(query, values, (err, result) => {
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

        // Desconectar do banco de dados
        client.end();
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
