const puppeteer = require('puppeteer')
const app = require('express')();

const PORT = 8000;
const URL = 'https://www.google.com/search?client=firefox-b-d&q=liga+espa%C3%B1ola#cobssid=s&sie=lg;/g/11mqlmppsd;2;/m/09gqx;mt;fp;1;;';

let leage = [];
let i = 0;
(async () => {
    const browser = await puppeteer.launch({
        headless: false
    });
    
    const page = await browser.newPage();
    await page.goto(URL);
    
    await page.click('#L2AGLb')

    await page.setViewport({
        width: 1200,
        height: 800
    });
    
    await autoScroll(page).catch((err)=>console.log(err));

    //Ineficient as Hell (I know)
    const play = await page.$$('.OcbAbf');
    let playdiv, jornada, jornadatxt;
    //First loop gets games separated by week-plays 
    for(let z = 0; z <play.length; z++){

        playdiv = await play[z].$('div[data-title] div');        
        if(playdiv) jornada = await playdiv.getProperty('textContent');
        if(jornada) jornadatxt = await jornada.jsonValue();
        console.log(jornadatxt);
        leage[z]={jornadatxt, games:[]};
        
        const element = await play[z].$$('.KAIX8d');
        //Second loop allows separation of games (1vs1)
        for(let j = 0; j < element.length; j++){

            leage[z].games[j]=[];

            const game = await element[j].$$('.L5Kkcd');
            let goal, team, goaltxt, goalraw, teamraw,teamtxt;
            //Third loop (where the good stuff resides)
            for(let i = 0; i<game.length; i++){

                goal  = await game[i].$('.imspo_mt__t-sc .imspo_mt__tt-w');
                team  = await game[i].$('.ellipsisize span');
                if(goal) goaltxt  = await goal.getProperty('textContent');
                if(team) teamtxt  = await team.getProperty('textContent');
                if(goaltxt) goalraw = await goaltxt.jsonValue();
                if(teamtxt) teamraw = await teamtxt.jsonValue();
                if(leage[z].games[j]){
                (goalraw || teamraw) ? leage[z].games[j].push(teamraw+" : "+goalraw) : '';
            }}

        }
    }

    await browser.close();
})();

async function autoScroll(page){
    await page.evaluate(async () => {
        await new Promise((resolve, reject) => {
            let timer = setInterval(() => {

                window.scrollBy(0, -window.innerHeight);

                // clearInterval(timer);
                // resolve(); 
                        
            }, 5000); //time spend scrolliing
        });
    });
}

app.get('/', (req, res)=>{
    res.status(200).send(leage);
});

app.listen(PORT, ()=>console.log(`Server running on port ${PORT}`))