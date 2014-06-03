var express = require('express');
var app = express(); // Create my app.

var fs = require('fs');
app.get('/', function(request, response) {
  fs.createReadStream('./views/index.html').pipe(response);
});
app.use('/static', express.static(__dirname + '/static'));

var http = require('http');
var server = http.createServer(app);

server.listen(process.env.PORT || 4000);

var colors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet", "gray"];

var names = ["Adam", "Bob", "Charlie", "Dave", "Edgar", "Frank", "Gertrude", "Heidi", "Iris", "Julia", "Kay", "Lee", "Max", "Noor", "Oli", "Panther", "Queen", "Rob", "Stew", "Trina", "Uma", "Violet", "Xavier", "Yelonda", "Zach"];

var sockets = {};

var io = require('socket.io').listen(server);
io.sockets.on('connection', function(socket) {
  var name = names.shift();
  var color = colors.shift();
  sockets[name] = socket;
  console.log('name: '+name);
  console.log('sockets[name]: '+sockets[name]);
  socket.emit('connected', name, color);

  socket.on('pm', function(data) {
    if (data.to == "All") {
      socket.broadcast.emit('pm', data);
    }
    else {
      var outsocket = sockets[data.to]
      if (outsocket) {
        console.log('data.to: '+data.to);
        console.log('sockets[data.to]: '+sockets[data.to]);
        outsocket.emit('pm', data);
      }
      else {
        socket.broadcast.emit('pm', data);
      }
    }
  });
});