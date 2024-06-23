const express = require('express');

// Internal Imports
const { apiRouter } = require('./routes/apiRouter');

const app = express();

// Setup Routes
app.use('/api', apiRouter);

module.exports = app;