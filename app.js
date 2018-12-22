//Browsing Default module of Express.
var express = require('express');
var http = require('http');

//Create an Express object.
var app = express();

//Setting up default port with properties in 'app' object.
app.set('port', process.env.PORT || 20206);

//Stating up the express server.
http.createServer(app).listen(app.get('port'), function(){
    console.log('Stared up the express server. : ' + app.get('port'));
});
