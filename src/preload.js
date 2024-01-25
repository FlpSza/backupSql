const { ipcRenderer, contextBridge } = require('electron');

// Expondo ipcRenderer de forma segura
contextBridge.exposeInMainWorld('ipc', {
  send: (channel, data) => {
    ipcRenderer.send(channel, data);
  },
  receive: (channel, func) => {
    ipcRenderer.on(channel, (event, ...args) => func(...args));
},
});
