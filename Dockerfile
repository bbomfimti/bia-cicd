FROM node:16-slim

WORKDIR /usr/src/app

# Copiar apenas os arquivos necessários do servidor
COPY package*.json ./
COPY server.js ./
COPY index.js ./
COPY lib/ ./lib/
COPY api/ ./api/
COPY config/ ./config/
COPY database/ ./database/

# Instalar dependências do servidor
RUN npm install --production --loglevel=error

# Criar pasta client vazia (sem build do React por enquanto)
RUN mkdir -p client
COPY client/build/ ./client/ 2>/dev/null || echo "No client build found, creating empty client folder"

EXPOSE 8080

CMD [ "npm", "start" ]
