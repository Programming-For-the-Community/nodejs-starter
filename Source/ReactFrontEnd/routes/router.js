const express = require('express');

// Internal Imports
const homePageService =  require('../services/homePageService');
const loginPageService = require('../services/loginPageService');

const router = express.Router();

router.get('/login', loginPageService);
router.get('/home', homePageService);

module.exports = router;