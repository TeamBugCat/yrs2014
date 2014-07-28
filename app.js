// Require libraries
var express = require('express');
var harp = require('harp');
var feedparser = require('feedparser');

// Set Main App Variables
app.set('port', process.env.PORT || 4000);

//Set Server up
// Start App requests
app.configure(function(){
  app.use('/app',express.static(__dirname + "/web"));
  app.use(harp.mount(__dirname + "/web"));
});
// Start Index Root Requests
app.configure(function(){
  app.use('/',express.static(__dirname + "/public"));
  app.use(harp.mount(__dirname + "/public"));
});


// Launch
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
