# Start from base node image based on Alpine
FROM node:16-alpine

# Set's the workdirectory to /app so we're at the root of where we want to drop code
WORKDIR /app

# Copy local files to /app on the container
COPY . .

# Clean installs dependencies for the frontend, meaning only the specified versions of those dependencies are installed
RUN npm ci 

# Builds the app
RUN npm run build

# Exposes port 3000 on the container
EXPOSE 3000

# Start the app
CMD [ "npx", "serve", "build" ]