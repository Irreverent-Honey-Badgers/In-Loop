# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http: //coffeescript.org/


var movie_name = "Top Gun";
var url_safe = encodeURI(movie_name);
var url = "http://omdbapi.com/?t=" + url_safe
var xhr = new XMLHttpRequest();
xhr.open("GET", url);
xhr.addEventListener("load", function() {
    //parse the JSON response
    var data = JSON.parse(xhr.responseText)
    //data is now an object
    console.log(data);
});
xhr.send();
