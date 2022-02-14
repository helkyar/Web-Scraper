const axios = require('axios');
const cheerio = require('cheerio');
const app = require('express')();

const PORT = 8000;
const URL = 'https://www.google.com/search?client=firefox-b-d&q=liga+espa%C3%B1ola#cobssid=s&sie=lg;/g/11mqlmppsd;2;/m/09gqx;mt;fp;1;;';

const leage = [];
axios(URL)
    .then(resp => {
        const html = resp.data;
        const $ = cheerio.load(html, { decodeEntities: false });
        console.log(html);
        //same notation as querySelectors
        $('.ellipsisize span', html).each(function (){
            const team = $(this).text();
            leage.push({ team })
        }); 
        console.log(leage);
    }).catch(error => console.log(error));

   app.get('/', (req, res)=>{
        res.status(200).send(leage);
   });

app.listen(PORT, ()=>console.log(`Server running on port ${PORT}`))