const amqp = require('amqplib/callback_api');

class QueueListener {

    constructor(inputMap = {
        username: 'guest',
        password: 'guest',
        host: 'host.docker.internal',
        port: 5672
    }) {
        this.user = inputMap.username;
        this.pwd = inputMap.password;
        this.host = inputMap.host;
        this.port = inputMap.port;
    }

    Configure(){
        return this;
    }

    async Listen() {
        
    }
}