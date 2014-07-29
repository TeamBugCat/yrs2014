console.log("Starting App");

// Require libraries 
var express = require('express');
var harp = require('harp');
var feedparser = require('feedparser');
var http = require('http');
var request = require('request');

// Initalise Express
var app = express();

// Add dedicated reader library.
var reader = require("./reader");

// Set Main App Variables
app.set('port', process.env.PORT || 4000);

//Set Server up
// Start App requests

if(process.env.TWILIO_SID && process.env.TWILIO_AUTH){
  console.log("Attempting to contact Twilio");
	var twilio = require('twilio');
  var client = require('twilio')(process.env.TWILIO_SID, process.env.TWILIO_AUTH);
}



app.use('/api/phonecall',function(req,res,next){
	//Create TwiML response
		var twiml = new twilio.TwimlResponse();
		twiml.say('Welcome to the disbility assistance service.')
    .pause({ length:1 })
    .say('The news support is presently being improved.', {
        voice:'man',
        language:'en-gb'
    });
		res.writeHead(200, {'Content-Type': 'text/xml'});
		res.end(twiml.toString());
});

app.use(express.static(__dirname + "/build/web"));
app.use(harp.mount(__dirname + "/build/web"));

// Launch
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
