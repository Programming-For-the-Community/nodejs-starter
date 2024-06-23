const express = require('express');
const path = require('path');

// Internal Imports
const homePageService =  require('../services/homePageService');

const apiRouter = express.Router();
const distPath = path.join(__dirname, '../dist');

// Setup Static Content
apiRouter.use('*', express.static(path.join(__dirname, distPath)));

apiRouter.get('/login', (req, res) => {
  console.log('api/login hit');
  res.sendFile(path.join(__dirname, distPath, 'index.html'));
});

apiRouter.get('/home', homePageService);

apiRouter.get('/', (req, res) => {
  console.log('api/ hit');
  res.send('Hello World!');
});

module.exports = apiRouter;