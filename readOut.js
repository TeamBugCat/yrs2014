var parser = require('parse-rss');
var twilio = require('twilio');
var fs = require("fs");
var http = require('http');
var request = require('request');
var parser = require('parse-rss');
var mustache = require('mustache');
var htmlToText = require('html-to-text');

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
        fs.writeFileSync("./feeds/"+id+".json~", JSON.stringify(rss), function(err) {
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
  if (!fs.existsSync("./feeds/"+id+".json~")) {
    updateCache();
  }
  var rss = JSON.parse(fs.readFileSync("./feeds/"+id+".json~",'utf8'));
  var template = fs.readFileSync('templates/callScript.txt','utf8');
  return mustache.render(template,{rss:rss});
}
exports.genScript = genScript;

function genScript2(id){
  if (!fs.existsSync("./feeds/"+id+".json~")) {
    updateCache();
  }
  var rss = JSON.parse(fs.readFileSync("./feeds/"+id+".json~",'utf8'));
  var newRss = [];
  for(var i in rss){
    var item = rss[i];
    var x = {};
    x.title = item.title;
    x.description = htmlToText.fromString(item.description,{});
    newRss.push(x);
  }
  var template = fs.readFileSync('templates/callScript.txt','utf8');
  return mustache.render(template,{rss:newRss});
}
exports.genScript2 = genScript2;
