console.log("Starting App");

// Require libraries
var express = require('express');
var harp = require('harp');
var feedparser = require('feedparser');
var http = require('http');
var request = require('request');
var fs = require('fs');

// Initalise Express
var app = express();

// Add dedicated reader library.
var reader = require("./readOut.js");

// Set Main App Variables
app.set('port', process.env.PORT || 4000);

//Set Server up
// Start App requests

if(process.env.TWILIO_SID && process.env.TWILIO_AUTH){
  console.log("Attempting to contact Twilio");
  var twilio = require('twilio');
  var client = twilio(process.env.TWILIO_SID, process.env.TWILIO_AUTH);
}

app.all('/api/phone',function(req,res){
  //Create TwiML response
	var twiml = new twilio.TwimlResponse();
      twiml.say('Welcome to the disbility assistance service.')
      .pause({ length:1 })
    .gather({
        action:'/api/phonecall',
        numdigits:'1'
    }, function() {
        this.say('Press 1 for BBC News, 2 for the Guardian, 3 for Al Jazeera, 4 for Daily Mail, 5 for Polygon, 6 for Ars Technica, 9 for Something.', {
          voice:'woman',
          language:'en-gb'
        });
    });
      
    res.set('Content-Type', 'text/xml');
    res.send(twiml.toString()); 
});

app.all('/api/phonecall',function(req,res,next){
	//Create TwiML response
  twilio.messages.create({
    body: "Jenny please?! I love you <3",
    to: "+44790977700",
    from: "+441647632031"
}, function(err, message) {
    process.stdout.write(message.sid);
});
	var twiml = new twilio.TwimlResponse();
    switch(req.param('Digits').toNumber()){
      case 1:
        twiml.redirect("/api/news/bbcNews");
        break;
      case 2:
        twiml.redirect("/api/news/theGuardian");
        break;
      case 3:
        twiml.redirect("/api/news/alJazeera");
        break;
      case 4:
        twiml.redirect("/api/news/dailyMail");
        break;
      case 5:
        twiml.redirect("/api/news/polygon");
        break;
      case 6:
        twiml.redirect("/api/news/arsTechnica");
        break;
      case 7:
        twiml.redirect("/johnson.xml");
        break;
      default:
        twiml.say("Button not registered" + req.param('Digits').toNumber());
    }
    res.set('Content-Type', 'text/xml');
    res.send(twiml.toString()); 
  
});

app.get("/johnson.mp3", function(req,res){
  res.sendfile("./pages/CaveJohnsonLemons.mp3");
});
app.get("/johnson.xml", function(req,res){
  res.sendfile("./pages/CaveJohnsonLemons.xml");
});

app.all('/api/news/:source',function (req,res,next){
  res.set('Content-Type', 'text/xml');
  reader.fetchTwimlAsync(req.param("source"), function (twiml) {
    res.send(twiml);
  });
});

app.all('/api/sources', function (req, res, next) {
  res.send(require('./rssFeeds'));
});

app.use('/pages/',express.static(__dirname + "/pages"));
app.use('/feeds/',express.static(__dirname + "/feeds"));
//app.use(harp.mount(__dirname + "/build/web"));
harp.compile(__dirname + "/build/web", __dirname + "/final", function(){});
app.use(express.static(__dirname + "/final"));

// Launch
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
