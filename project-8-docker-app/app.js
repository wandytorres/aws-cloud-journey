const http = require('http');

const server = http.createServer((req, res) => {
  res.end("🚀 ECS CI/CD funcionando desde GitHub Actions!");
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});
