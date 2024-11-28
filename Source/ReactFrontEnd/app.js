const express = require('express');
const path = require('path');


// Internal Imports
const apiRouter = require('./routes/router');

const app = express();

// Setup Middleware
app.use(express.static(path.join(__dirname, 'dist')));

// Setup Routes
app.use(apiRouter);



module.exports = app;