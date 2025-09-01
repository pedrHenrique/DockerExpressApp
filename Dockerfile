# Runtime Enviromment
FROM node:22

# Boa prática
WORKDIR /app

# Copy Dependências
COPY package*.json .

# Copy Código Fonte
COPY src .

# Run Instalar as Dependências (NPM CI -> Clean Install)
RUN npm ci

# Export Porta
EXPOSE 3000

# Run node start
CMD [ "node", "index.js" ]