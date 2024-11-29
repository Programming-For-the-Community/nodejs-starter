# nodejs-starter
Node.js Starter project demonstrating the Node.js concepts below:
- Database connections via MongoDB
- Pub-sub design model leveraging RabbitMQ
- Web servers using Express
- Front-end design using React
- IaaS cloud hosting using AWS and terraform
- CI/CD Implemented in AWS using Github Webhooks

## Running the application
The entire application can be launched and shut down via github actions.

### Launching the Application
To launch the application, go to the 'Actions' tab in github and navigate to the <b>Application Launch</b> workflow, select the 'Run workflow' dropdown, and select the 'Branch: main' option to build the most current working application from the main branch.

### Shutting down the Application
To shut down the application, go to the 'Actions' tab in github and navigate to the <b>Teardown Application</b> workflow, select the 'Run workflow' dropdown, and select the 'Branch: main' option to build the most current working application from the main branch.

## AWS Login Instrucions

## Terraform Deployment Instructions
Terraform code is deployed via the terraform.yml file in the .github/workflows folder.

To execute the just the terraform build, go to the 'Actions' tab in github and navigate to the tf/dev workflow, select the 'Run workflow' dropdown, and select the 'Branch: main' option to build the most current working infrastructure from the main branch.

## RabbitMQ 
This project contains a custom RabbitMQ Docker image that changes the default username and password of RabbitMQ to user default values as well as scripts to deploy the docker containter and push the custom image to a private repository. Details about how to use the custom image are included below.

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

## React Front End
Create the react front end with the following commands:
1. npm install -g create-react-app
2.npx create-react-app react-front-end (creates a react app named 'react-front-end')
