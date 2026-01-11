FROM node:14-slim

WORKDIR /usr/src/app

# Copiar apenas arquivos essenciais
COPY server.js ./
COPY index.js ./

# Criar package.json mínimo apenas com dependências essenciais
RUN echo '{"name":"bia","version":"1.0.0","main":"server.js","scripts":{"start":"node server.js"},"dependencies":{"express":"^4.17.1","cors":"^2.8.5"}}' > package.json

RUN npm install --loglevel=error

# Criar estrutura básica
RUN mkdir -p client lib api config database
COPY lib/ ./lib/ 2>/dev/null || echo "No lib folder"
COPY api/ ./api/ 2>/dev/null || echo "No api folder"  
COPY config/ ./config/ 2>/dev/null || echo "No config folder"
COPY database/ ./database/ 2>/dev/null || echo "No database folder"

EXPOSE 8080

CMD [ "npm", "start" ]
