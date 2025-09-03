# Runtime Enviromment
FROM node:22-alpine

# Boa prática
WORKDIR /app

# Copy Dependências
COPY package*.json .

# Run Instalar as Dependências (NPM CI -> Clean Install)
RUN npm ci

# Copy Código Fonte
COPY . .

# Podemos definir as variáveis aqui também. (Elas podem ser sobrescritas no CLI tbm!)
# ENV PORT=5000
# ENV APP_NAME="Meu App Express"

# Export Porta
EXPOSE $PORT

# Run node start
CMD [ "npm", "start" ]