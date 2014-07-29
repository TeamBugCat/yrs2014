console.log("Test");

// Require libraries 
var express = require('express');
var harp = require('harp');
var feedparser = require('feedparser');
var http = require('http');
if(process.env.TWILIO_SID&&process.env.TWILIO_AUTH){
  var client = require('twilio')(process.env.TWILIO_SID, process.env.TWILIO_AUTH);
}

var app = express();

// Set Main App Variables
app.set('port', process.env.PORT || 4000);

//Set Server up
// Start App requests
app.use('/',express.static(__dirname + "/build/web"));
app.use(harp.mount(__dirname + "/build/web"));

/* Insert api defs here */

// Launch
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
