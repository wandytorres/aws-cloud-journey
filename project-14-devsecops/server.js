const http = require('http');

http.createServer((req,res)=>{
  res.write("Project 14 - DevSecOps");
  res.end();
}).listen(3000);
