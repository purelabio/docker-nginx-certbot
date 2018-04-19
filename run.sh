#!/bin/sh

certbot certonly                             \
  --verbose                                  \
  --noninteractive                           \
  --standalone                               \
  --agree-tos                                \
  --email $CERTBOT_EMAIL                     \
  -d $NGINX_SITE                          && \
crond -l 0                                && \
envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && \
nginx -g 'pid /tmp/nginx.pid; daemon off;'
