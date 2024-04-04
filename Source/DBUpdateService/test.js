const amqp = require('amqplib/callback_api');

amqp.connect('amqp://admin:pwd@localhost', (err, cxn) => {
    if(err) {
        throw err;
    }

    cxn.createChannel((err, ch) => {
        if(err) {
            throw err;
        }
        ch.assertQueue('update', {durable: true});
        ch.publish('update', '', Buffer.from('Hello World!'));
        console.log(' [x] Sent "Hello World!"');
    });
});