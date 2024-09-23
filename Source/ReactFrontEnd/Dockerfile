FROM bitnami/node:latest

# Set Working Dirctory
WORKDIR /app

# Copy package.json
COPY package*.json ./

# Install Dependencies
RUN npm install --production

# Copy Source Code
COPY . .

# FOR DEVELOPMENT
RUN NODE_ENV=.env.docker

EXPOSE 8443
EXPOSE 8080

CMD ["npm", "run", "start"]