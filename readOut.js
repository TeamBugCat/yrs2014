var parser = require('parse-rss');
var twilio = require('twilio');
var fs = require("fs");
var http = require('http');
var request = require('request');
var parser = require('parse-rss');
var mustache = require('mustache');

var rssFeeds = require("./rssFeeds");

function updateCache(){
  for(var id in rssFeeds) {
    var feed = rssFeeds[id];
    console.log("Attempting "+id);
    
    parseAndSave(id, feed);
    
 }
}
exports.updateCache = updateCache;

function parseAndSave(id, feed) {
  parser(feed.index, function(err,rss){
      if(err){
        console.log("Error: " + err)
      } else {
        fs.writeFile("./feeds/"+id+".json~", JSON.stringify(rss), function(err) {
            if(err) {
                console.log(err);
            } else {
                console.log("The file "+id+".json~ was saved");
            }
        });
      }}
    )  
}

function readRss(id, callback){
  fs.readFile("./feeds/"+id+".json~",function(err,data){
    if (err) {
      console.log("Error: "+err);
      return false;
    }else{
      callback(data);
    }
  })
}
exports.readRss = readRss;

function genScript(id){
  var rss = JSON.parse(fs.readFileSync("./feeds/"+id+".json~",'utf8'));
  var template = fs.readFileSync('templates/callScript.txt','utf8');
  return mustache.render(template,{rss:rss});
}
exports.genScript = genScript;
