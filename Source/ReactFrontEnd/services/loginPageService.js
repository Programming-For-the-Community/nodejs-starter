const logger = require('../lib/logger');
const path = require('path');

const loginPageService = (req, res) => {
  logger.info('/login hit');
  const fileToSend = path.join(__dirname, '../dist', 'index.html');
  logger.debug(`Sending file from: ${fileToSend}`);
  res.sendFile(fileToSend);
};

module.exports = loginPageService;