var http = require('http');

var userCount = 0;

var port = 3000;

var server = http.createServer(function (req, res) {

    if (req.method === 'POST')
    {
        userCount++;
        res.end();
    }
    else if (req.method === 'GET'){
        res.writeHead(200, { 'Content-Type': 'text/plain' });
        res.write('We have had ' + userCount + ' POST requests! (test3)\n');
        res.end();
    }

});

server.listen(port);

console.log('server running on port ' + port);