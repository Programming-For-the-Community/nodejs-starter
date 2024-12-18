const logger = require('../lib/logger');
const path = require('path');

const homePageService = (req, res) => {
  logger.info('/home hit');
  const fileToSend = path.join(__dirname, '../dist', 'index.html');
  logger.debug(`Sending file from: ${fileToSend}`);
  res.sendFile(fileToSend);
};

module.exports = homePageService;