# Use Node LTS
FROM node:18-alpine

WORKDIR /app

# Copy package files and install
COPY package*.json ./
RUN npm ci --only=production

# Copy app sources
COPY . .

# Expose port 3000
EXPOSE 3000

# Start app
CMD ["npm", "start"]
