var fs = require("fs");
var feedparser = require('feedparser');
var http = require('http');
var request = require('request');
var rsj = require('rsj');

var rssFeed = require("./rssFeeds");
var data;

 function updateCache(){
	rsj.r2j(rssFeed.bbcNews.index,function(json) {
		console.log(json);
		fs.writeFile("./bbc-rss.json~", json, function(err) {
				if(err) {
						console.log(err);
				} else {
						console.log("The file was saved!");
				}
		});
	})
}
exports.updateCache = updateCache;

function getNews(){
	if (!fs.existsSync('./bbc-rss.json~')) {
			updateCache();
	}
	fs.readFile('./bbc-rss.json~', function (error, data) {
		if (error){
			console.error("Error: " + error);
		}else{
			console.log(data.toString("utf8"));
		}
	});
}
exports.getNews = getNews;
