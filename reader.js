var fs = require("fs");
var feedparser = require('feedparser');
var http = require('http');
var request = require('request');
var parser = require('parse-rss');

var rssFeed = require("./rssFeeds");
var data;

function cacheFileName(id) {
  return "./feeds/"+id+".json~";
}

function onerr(err) {
  if (err) {
    console.log("Error: "+err);
  }
}

function updateCache(id) {
  parser(rssFeed[id].index, function(err,rss){
    if(err){
      console.log("Error: " + err)
    } else {
      fs.writeFile(cacheFileName(id), JSON.stringify(rss), function(err) {
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

function fetchNews(){
  for (var id in rssFeed) {
	  if (!fs.existsSync(cacheFileName(id))) {
			  updateCache(id);
	  }
	  fs.readFile(cacheFileName(id), function (error, data) {
		  if (error){
			  console.error("Error: " + error);
		  }else{
			  //console.log(data.toString("utf8"));
        var news = JSON.parse(data.toString("utf8"));
		  }
	  });
	}
}
exports.fetchNews = fetchNews;

function getNews(id, callback){
  if (!fs.existsSync(cacheFileName(id))) {
    fetchNews();
  }
  fs.readFile(cacheFileName(id), function (error, data) {
    onerr();
    
    return JSON.parse(data.toString("utf8"));
  });
}
exports.getNews = getNews;
