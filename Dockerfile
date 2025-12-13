# Use an official node.js runtime as a parent image
FROM node:22-alpine

WORKDIR /app

COPY package*.json .

RUN apk add --no-cache openssl

RUN npm install


COPY . .

EXPOSE 5003

CMD ["node", "./src/server.js"]