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
      fs.writeFile("./feeds/"+feed.id+".json", JSON.stringify(rss), function(err) {
          if(err) {
              console.log(err);
          } else {
              console.log("The file was saved!");
          }
      });
    }}
  )  
 }
}}
