const HealthCheckComponent = {
  status: 'UP',
  version: process.env.APP_VERSION,
  environment: process.env.ENV,
  message: `${process.env.APP_NAME} is up and running!`,
};

module.exports = HealthCheckComponent;