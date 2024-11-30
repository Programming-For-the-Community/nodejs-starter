const axios = require('axios');

exports.handler = async (event, context) => {

    console.log(JSON.stringify(event));
    // const body = JSON.parse(event.body);
    const apiHost = event.body.apiHost;
    const apiKey = event.body.apiKey;
    // const apiHost = 'nfl-api-data.p.rapidapi.com';
    // const apiKey = 'd168f68c7amshc3224962beb33ecp1f3643jsn8530e6acc0bc';
    const apiUrl = `https://${apiHost}/nfl-team-listing/v1/data`;
    let response;
    let myTeam;

    axios.get(apiUrl, {
        headers: {
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': apiHost
        }
    })
    .then((res) => {
        response = res.data;
    });

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