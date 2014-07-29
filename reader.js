var fs = require("fs");
var feedparser = require('feedparser');
var http = require('http');
var request = require('request');
var parser = require('parse-rss');

var rssFeed = require("./rssFeeds");
var data;

function updateCache(){
  parser(rssFeed.bbcNews.index,function(err,rss){
    if(err){
      console.log("Error: " + err)
    }else{
      fs.writeFile("./feeds/bbc-rss.json", JSON.stringify(rss), function(err) {
          if(err) {
              console.log(err);
          } else {
              console.log("The file was saved!");
          }
      });
    }
  })
   /*
  feedParser.parseUrl(url, function (er, meta, articles) {
	rsj.r2j(rssFeed.bbcNews,function(json) {
		console.log(json);
		fs.writeFile("./bbc-rss.json", json, function(err) {
				if(err) {
						console.log(err);
				} else {
						console.log("The file was saved!");
				}
		});
	})*/
}
exports.updateCache = updateCache;

function getNews(){
	if (!fs.existsSync('./feeds/bbc-rss.json')) {
			updateCache();
	}
	fs.readFile('./feeds/bbc-rss.json', function (error, data) {
		if (error){
			console.error("Error: " + error);
		}else{
			console.log(data.toString("utf8"));
      var news=JSON.parse(data.toString("utf8"));
		}
	});
}
exports.getNews = getNews;

function showNews(){
  	fs.readFile('./feeds/bbc-rss.json', function (error, data) {
		if (error){
			console.error("Error: " + error);
		}else{
			console.log(data.toString("utf8"));
      			 return JSON.parse(data.toString("utf8"));
		}
	});
}
exports.showNews = showNews;
