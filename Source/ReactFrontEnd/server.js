require('dotenv').config({path: (process.env.NODE_ENV !== undefined)? process.env.NODE_ENV : '.env'});

const https = require('https');
const http = require('http');

// Internal Imports
const app = require('./app');
const logger = require('./lib/logger');
const { serverConfig } = require('./config/serverConfig');

serverConfig.tls? https.createServer(app).listen(serverConfig.httpsPort, () => {
  logger.info(`HTTP Server running on port ${serverConfig.httpPort}`);
  logger.debug(`Server Config: ${JSON.stringify(serverConfig)}`);
}) : 

  http.createServer(app).listen(serverConfig.httpPort, () => {
    logger.info(`HTTP Server running on port ${serverConfig.httpPort}`);
    logger.debug(`Server Config: ${JSON.stringify(serverConfig)}`);
  });

