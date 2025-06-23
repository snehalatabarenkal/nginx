# Use the official Nginx base image
FROM nginx:alpine

# Replace the default index page
COPY index.html /usr/share/nginx/html/index.html
