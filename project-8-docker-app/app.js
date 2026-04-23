const http = require('http');

const server = http.createServer((req, res) => {
  res.end("🚀 Wandy DevOps Docker App Running!");
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});
