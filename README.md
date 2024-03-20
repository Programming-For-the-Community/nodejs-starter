# nodejs-starter
Node.js Starter project demonstrating the Node.js concepts below:
- Database connections via MongoDB
- Pub-sub design model leveraging RabbitMQ
- Web servers using Express
- Front-end design using React
- IaaS cloud hosting using AWS and terraform
- CI/CD Implemented in AWS using Github Webhooks

## AWS Login Instrucions

## Terraform Deployment Instructions

## RabbitMQ Setup
Verify that RabbitMQ is installed on your device. If not, execute the command below and follow all the prompts to install RabbitMQ using chocolatey:
    - choco install rabbitmq

Execute the script to run the rabbitmq docker container following the steps below
    1. Open a bash terminal
        - Open in VSCode, git bash, whichever you prefer
    2. Execute the script using the command below:
        - ./Source/Scripts/rabbit-deploy.sh
    3. You should be able to connect to your rabbitmq server in a few moments via http://localhost:5672
## MongoDB Setup
