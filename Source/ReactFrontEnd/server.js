const express = require('express');
require('dotenv').config(process.env.NODE_ENV === undefined? '.env' : process.env.NODE_ENV);

const app = express();
const port = process.env.APP_HTTP_PORT;

app.listen(port, ()=>{
    console.log(`Listening on port ${port}`);
});