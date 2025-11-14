#!/bin/bash
set -e

# Replace variable in template and create final index.html
envsubst '$YOUR_NAME' < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html

# Start nginx
nginx -g 'daemon off;'
