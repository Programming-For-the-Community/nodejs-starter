require('dotenv').config({path: (process.env.NODE_ENV !== undefined)? process.env.NODE_ENV : '.env'});

const defaultFormat = '[%s] %s: [processor: %s, platform: %s@%s, app: %s@%s]: %s';

const loggerConfig = {
  level: (process.env.LOG_LEVEL === undefined)? 'info' : process.env.LOG_LEVEL,
  format: (process.env.LOG_FORMAT === undefined)? defaultFormat : process.env.LOG_FORMAT
};

module.exports = loggerConfig;