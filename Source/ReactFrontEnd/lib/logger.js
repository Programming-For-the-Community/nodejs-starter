const { createLogger, format, transports } = require('winston');
const { combine, timestamp, printf } = format;
const os = require('os');
const util = require('util');

// Internal Imports
const loggerConfig = require('../config/loggerConfig');
const { serverConfig } = require('../config/serverConfig');

// Define the log format
const myFormat = printf(({ level, message, timestamp }) => {
  return util.format(loggerConfig.format, level.toUpperCase(), timestamp, os.hostname(), os.platform(), os.release(), serverConfig.appName, serverConfig.appVersion, message);
});

const logger = createLogger({
  level: loggerConfig.level,
  format: combine(
    timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
    myFormat
  ),
  transports: [
    new transports.Console({
      level: loggerConfig.level
    })
  ]
});

logger.debug(`Logger Config: ${JSON.stringify(loggerConfig)}`);

module.exports = logger;