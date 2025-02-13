import http from 'http';
import fs from 'fs';
const port = 3000;


const server = http.createServer(function(req, res) {
   res.writeHead(200, { 'Content-Type': 'text/html' });
   fs.readFile('sur.html', function(error, data) {
    if (error) {
    res.writeHead(400)
    res.write('error: file not found');
   } else {
    res.write(data);
   }
   res.end();
   });
   return;
});

server.listen(port, function(error) {
    if (error) {
        console.log('Something went wrong', error);
    } else {
        console.log('Server is listening on port ' + port);
    }
});

