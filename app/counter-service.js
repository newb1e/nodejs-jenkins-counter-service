//test1

var http = require('http');

var userCount = 0;

var server = http.createServer(function (req, res) {

    if (req.method === 'POST')
    {
        userCount++;
        res.end();
    }
    else if (req.method === 'GET'){
        res.writeHead(200, { 'Content-Type': 'text/plain' });
        res.write('We have had ' + userCount + ' POST requests!\n');
        res.end();
    }

});

server.listen(1080);

console.log('server running...');