const express = require('express');
const path = require('path');


// Internal Imports
const apiRouter = require('./routes/router');
const { serverConfig } = require('./config/serverConfig');

const app = express();

// Setup Middleware
app.use(`/${serverConfig.appName}`, express.static(path.join(__dirname, 'dist')));

// Setup Routes
app.use(`/${serverConfig.appName}`, apiRouter);



module.exports = app;