const axios = require('axios');

exports.handler = async (event, context) => {

    // Log Event contents
    console.log(`Event: ${JSON.stringify(event)}`);
    // var eventItems = JSON.parse(event);

    // Parse Event Contents
    const apiHost = event.apiHost;
    console.log(`API Host: ${apiHost}`);

    const apiKey = event.apiKey;
    console.log(`API Key: ${apiKey}`);
    // const apiHost = 'nfl-api-data.p.rapidapi.com';
    // const apiKey = 'd168f68c7amshc3224962beb33ecp1f3643jsn8530e6acc0bc';

    // Construct API URL
    const apiUrl = `https://${apiHost}/nfl-team-listing/v1/data`;
    console.log(`API URL: ${apiUrl}`);

    let response;
    let myTeam;

    // Make API Call
    await axios.get(apiUrl, {
        headers: {
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': apiHost
        }
    })
    .then((res) => {
        response = res.data;
        console.log(res.data);
    });

    // Log Response
    console.log(`Response: ${response}`);

    // Parse Response
    response.forEach((team) => {
        if (team.team.displayName === 'Minnesota Vikings') {
            myTeam = team.team;
        }
    });

    if (myTeam === undefined) {
        return {
            statusCode: 404,
            body: 'Team not found',
            headers: {
                'Content-Type': 'text/plain'
            }
        };
    } else {
        return {
            statusCode: 200,
            body: JSON.stringify(myTeam),
            headers: {
                'Content-Type': 'application/json'
            }
        };
    }
}