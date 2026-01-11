FROM node:14-slim

WORKDIR /usr/src/app

# Criar um servidor mínimo
RUN echo 'const express = require("express"); const app = express(); app.get("/", (req, res) => res.send("BIA App Running!")); app.listen(8080, () => console.log("Server running on port 8080"));' > server.js

# Package.json mínimo
RUN echo '{"name":"bia","version":"1.0.0","scripts":{"start":"node server.js"},"dependencies":{"express":"^4.17.1"}}' > package.json

RUN npm install

EXPOSE 8080

CMD ["npm", "start"]
