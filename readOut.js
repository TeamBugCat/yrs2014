var parser = require('parse-rss');
var twilio = require('twilio');
var fs = require("fs");
var http = require('http');
var request = require('request');
var parser = require('parse-rss');

var rssFeeds = require("./rssFeeds");

function updateCache(){
  for(var feed in rssFeeds){
  parser(feed.index,function(err,rss){
    if(err){
      console.log("Error: " + err)
    }else{
      fs.writeFile("./feeds/"+feed.id+".json~", JSON.stringify(rss), function(err) {
          if(err) {
              console.log(err);
          } else {
              console.log("The file was saved!");
          }
      });
    }}
  )  
 }
}
exports.updateCache = updateCache;

function readRss(id){
  fs.readfile("./feeds/"+id+".json~",function(err,data){
    if (err) {
      console.log("Error: "+err);
      return false;
    }else{
      return data;
    }
  })
}
exports.readRss = readRss;

function genScript(id){
  var rss = JSON.parse(fs.readFileSync("./feeds/"+id+".json~",'utf8'));
  var template = fs.readFileSync('templates/callScript.txt','utf8');
  return Mustache.render(template,rss);
}
exports.genScript = genScript;
