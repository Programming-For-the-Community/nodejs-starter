require('dotenv').config({path: (process.env.NODE_ENV !== undefined)? process.env.NODE_ENV : '.env'});

// Internal Imports
const toBoolean = require('../lib/functions/toBoolean');

const serverConfig = {
  tls: toBoolean(process.env.TLS_ENABLED),
  httpPort: process.env.APP_HTTP_PORT,
  httpsPort: process.env.APP_HTTPS_PORT,
  appName: process.env.APP_NAME,
  appVersion: process.env.APP_VERSION,
  apiVersion: process.env.API_VERSION,
};

module.exports = {
  serverConfig
};