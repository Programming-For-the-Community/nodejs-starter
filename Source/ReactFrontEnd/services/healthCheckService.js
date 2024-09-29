const logger = require('../lib/logger');
const healthCheckComponent = require('../objects/apiObjects/healthCheckComponent');

const healthCheckService = (req, res) => {
  logger.debug('/health hit');

  const healthCheck = healthCheckComponent;
  
  // Try to send a successful health check
  try {
    logger.info(`Health Check: ${JSON.stringify(healthCheck)}`);

    return res.status(200).json((healthCheck));

  // If health check fails, send an error
  } catch (err) {
    logger.error(`Health Check Error: ${err}`);

    healthCheck.status = 'DOWN';
    healthCheck.message = err.message;

    return res.status(500).json((healthCheck));
  }
};

module.exports = healthCheckService;