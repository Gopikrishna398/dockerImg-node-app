# Use official Node image
FROM node:18
# Set working directory
WORKDIR /app

# Copy only package files first
COPY package*.json ./

# Install all dependencies (including jest)
RUN npm install

# Copy files
COPY . .

EXPOSE 3000 3000

# Run the app
CMD ["node", "index.js"]
