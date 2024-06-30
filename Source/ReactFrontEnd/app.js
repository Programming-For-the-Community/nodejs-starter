const express = require('express');
// const path = require('path');
// const logger = require('./lib/logger');

// Internal Imports
const apiRouter= require('./routes/apiRouter');

const app = express();

// Setup Routes
app.use('/api', apiRouter);

module.exports = app;