const moment = require('moment');
//Firebase Admin Setup
const firebase = require("firebase");
const firebaseAdmin = require("firebase-admin");
const serviceAccount = require("./studioso6b7f3firebaseadminsdk.json");
firebaseAdmin.initializeApp({
    credential: firebaseAdmin.credential.cert(serviceAccount),
    databaseURL: "https://studioso-6b7f3.firebaseio.com"
});
//var StatsD = require('node-dogstatsd').StatsD;
//var dogstatsd = new StatsD();

// Increment a counter.
//dogstatsd.increment('page.views')

const miscRef = firebaseAdmin.firestore().collection('Misc').doc('AppleExpodite');
var readline = require('readline');
var rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout

});
function wait(ms) {
    const start = new Date().getTime();
    let end = start;
    while (end < start + ms) {
        end = new Date().getTime();
    }
}
function getBoolean(value){
    switch(value){
        case true:
        case "true":
        case 1:
        case "1":
        case "on":
        case "yes":
            return true;
        default:
            return false;
    }
}
wait(500);
// function Spoofing() {
    // process.stdout.write('5 1 2 3 4');
    const now = new Date();
    // var whatValBool = rl.input;
    rl.question("Whats the value  ", function(answer) {
        const date = moment(now).format('YYYYMMDD');
        var valBool = getBoolean(answer);
//        miscRef.update("testOff", valBool);
        miscRef.update("testOffNotif", valBool);
        miscRef.update("date", date);
        console.log("done, values are: date, testOff ", date, valBool);

    rl.close();
    });

// }
wait(500);
// Spoofing();
