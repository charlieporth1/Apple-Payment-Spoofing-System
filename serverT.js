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
/*var rl1 = readline.createInterface({
    input: process.stdin,
    output: process.stdout

});
var rl2 = readline.createInterface({
    input: process.stdin,
    output: process.stdout

});
var rl3 = readline.createInterface({
    input: process.stdin,
    output: process.stdout

});*/
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
        case "True":
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
    const date = moment(now).format("YYYYMMDD"); 
wait(500);
    rl.question("Whats the value Notif ", function(answer) {
//   rl.question("Whats the value Test OffTEacher  ", function(answer1) {
   	let answer1 = answer.split(" ")[1]
    	 answer = answer.split(" ")[0]
        const valBool = getBoolean(answer);
        miscRef.update("testOff", valBool);
        miscRef.update("testOffNotif", valBool);
        miscRef.update("date", date);
        console.log("done, values are: date, testOffNotif ", date, valBool);
        const valBool1 = getBoolean(answer1);
        miscRef.update("testOffTeach", valBool1);
        miscRef.update("date", date);
        console.log("done, values are: date, testOffTeach ", date, valBool1);
    rl.close();
    });
/*   rl.question("Whats the value Test OffTEacher  ", function(answer1) {
        const valBool1 = getBoolean(answer1);
        miscRef.update("testOffTeach", varBool1);
        miscRef.update("date", date);
        console.log("done, values are: date, testOffTeach ", date, valBool1);
*/
  //  rl.close();
/*    });
*/
// }
wait(500);
// Spoofing();
