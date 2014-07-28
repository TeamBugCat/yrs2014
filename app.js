console.log("Test");

// Require libraries
var express = require('express');
var harp = require('harp');
var feedparser = require('feedparser');
var http = require('http');

var app = express();

// Set Main App Variables
app.set('port', 4000);

//Set Server up
// Start App requests
app.use('/app',express.static(__dirname + "/web"));
app.use(harp.mount(__dirname + "/web"));

// Start Index Root Requests
app.use('/',express.static(__dirname + "/public"));
app.use(harp.mount(__dirname + "/public"));


// Launch
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
