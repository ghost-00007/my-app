# Use the official Nginx image as the base image
FROM nginx:latest

# Copy website files into the Nginx default html directory
COPY ./index.html /usr/share/nginx/html

# Expose port 80
EXPOSE 80
