const express = require('express');
const path = require('path');

// Internal Imports
const homePageService =  require('../services/homePageService');
const logger = require('../lib/logger');

const apiRouter = express.Router();

// Static Conent
apiRouter.use(express.static(path.join(__dirname, '../src')));

apiRouter.get('/login', (req, res) => {
  logger.debug('api/login hit');
  res.send('Login Page');
  logger.debug('Login Page Sent');
});

apiRouter.get('/home', homePageService);

// apiRouter.get('/', (req, res) => {
//   logger.debug('api/ hit');
//   res.send('Hello World!');
// });

module.exports = apiRouter;