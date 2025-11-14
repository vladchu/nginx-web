FROM nginx:latest

RUN apt-get update && apt-get install -y gettext-base

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html.template /usr/share/nginx/html/index.html.template
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENV YOUR_NAME="Anonymous"

ENTRYPOINT ["/entrypoint.sh"]
