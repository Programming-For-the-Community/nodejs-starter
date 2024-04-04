const amqp = require('amqplib/callback_api');

const express = require('express');

const app = express();
const port = 3000;

app.listen(port, () => {
    console.log(`Listening on port ${port}`);

    amqp.connect('amqp://admin:pwd@localhost:5672/', (err, cxn) => {
        if(err) {
            throw err;
        }
        console.log('Connected to RabbitMQ');
        cxn.createChannel((err, ch) => {
            if(err) {
                throw err;
            }
            ch.assertQueue('update', {durable: true});
            ch.consume('update', (msg) => {
                if(msg !== null) {
                    console.log(msg.content.toString());
                    ch.ack(msg);
                }
            });
        });
    });
});