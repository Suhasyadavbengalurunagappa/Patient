FROM node:20-alpine
WORKDIR /app

# Copy package.json first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy your application code
COPY index.js .

# Change ownership to node user
RUN chown -R node:node /app
USER node

# Match the port your app actually uses (3000)
EXPOSE 3001

CMD ["node", "index.js"]