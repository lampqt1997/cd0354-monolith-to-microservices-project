# Use an official Node.js base image compatible with ARM64
FROM node:16 AS ionic-builder

# Install Ionic CLI
RUN npm install -g @ionic/cli

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm ci

# Bundle app source
COPY . .
RUN ionic build

# Use an official Nginx image that supports ARM64
FROM nginx:alpine
COPY --from=ionic-builder /usr/src/app/www /usr/share/nginx/html