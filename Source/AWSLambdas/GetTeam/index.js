const axios = require('axios');

exports.handler = async (event, context) => {

    // Log Event contents
    console.log(`Event: ${JSON.stringify(event)}`);
    const eventItems = JSON.parse(event);

    // Parse Event Contents
    const apiHost = eventItems.apiHost;
    console.log(`API Host: ${apiHost}`);

    const apiKey = eventItems.apiKey;
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
        console.log(JSON.stringify(res));
    });

    // Log Response
    console.log(`Response: ${JSON.stringify(response)}`);

    // Parse Response
    response.foreach((team) => {
        if (team.displayName === 'Minnesota Vikings') {
            myTeam = team;
        }
    });

    if (myTeam === undefined) {
        return {
            statusCode: 404,
            body: 'Team not found' 
        };
    } else {
        return {
            statusCode: 200,
            body: JSON.stringify(myTeam)
        };
    }
}