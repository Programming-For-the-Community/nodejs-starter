require('dotenv').config({path: (process.env.NODE_ENV !== undefined)? process.env.NODE_ENV : '.env'});

const https = require('https');
const http = require('http');

// Internal Imports
const { app } = require('./app');
const { serverConfig } = require('./config/serverConfig');

serverConfig.tls? https.createServer(app).listen(serverConfig.httpsPort, () => {
  console.log(`HTTPS Server running on port ${serverConfig.httpsPort}`);
  console.log(JSON.stringify(serverConfig));
}) : 

  http.createServer(app).listen(serverConfig.httpPort, () => {
    console.log(`HTTP Server running on port ${serverConfig.httpPort}`);
    console.log(JSON.stringify(serverConfig));
  });

