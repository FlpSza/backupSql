const { require, ipcRenderer } = require('electron');

function buscarHorarioAgendado() {
    const diaAgendado = document.getElementById('agendado').value;
    ipcRenderer.send('buscar-horario-agendado', diaAgendado);
}

ipcRenderer.on('horario-agendado', (event, { dia, horario }) => {
    console.log(`Horário agendado para ${dia}: ${horario}`);
    document.getElementById('horarioAgendado').textContent = `Horário Agendado: ${horario}`;
});

// Adicione outras funções conforme necessário
