const express = require('express');

// Internal Imports
const homePageService =  require('../services/homePageService');
const loginPageService = require('../services/loginPageService');
const healthCheckService = require('../services/healthCheckService');

const router = express.Router();

router.get('/login', loginPageService);
router.get('/home', homePageService);
router.get('/health', healthCheckService);

module.exports = router;