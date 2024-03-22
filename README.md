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

## RabbitMQ 

### Updating Custom RabbitMQ Image
1. Navigate to Source/RabbitMQ
2. Edit the Dockerfile and rabbitmq.conf file to include any changes you wish to make
3. Update the version in the rabbit-push.sh file and then execute the file to push the new image to a private repository using one of the commands below:
  * rabbit-push.sh <b>OR</b> bash rabbit-push.sh

### Standing up RabbitMQ
1. Open a bash terminal
  * Open in VSCode, git bash, whichever you prefer
3. Execute the script using the command below:
  * ./Source/Scripts/rabbit-deploy.sh
4. You should be able to connect to your rabbitmq server in a few moments via http://localhost:15672

## MongoDB Setup
