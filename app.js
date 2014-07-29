console.log("Test");

// Require libraries 
var express = require('express');
var harp = require('harp');
var feedparser = require('feedparser');
var http = require('http');

// Initalise Express
var app = express();

// Set Main App Variables
app.set('port', process.env.PORT || 4000);

//Set Server up
// Start App requests

if(process.env.TWILIO_SID && process.env.TWILIO_AUTH){
  console.log("Attempting to contact Twilio");
  var client = require('twilio')(process.env.TWILIO_SID, process.env.TWILIO_AUTH);
  
  app.use('/api/phonecall',function(req,res,next){
		//Create TwiML response
		var twiml = new twilio.TwimlResponse();
		twiml.say('Hello World!')
    .pause({ length:3 })
    .say('Good, Day, the news will be coming soon.', {
        voice:'man',
        language:'en-gb'
    });
		res.writeHead(200, {'Content-Type': 'text/xml'});
		res.end(twiml.toString());
  }
}

app.use('/',express.static(__dirname + "/build/web"));
app.use(harp.mount(__dirname + "/build/web"));

/* Insert api defs here */

// Launch
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
