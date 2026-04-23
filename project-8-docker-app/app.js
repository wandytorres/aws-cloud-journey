const http = require('http');

const server = http.createServer((req, res) => {
  res.end("🚀 ECS Version 2 deployed from CI/CD Working!");
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});
