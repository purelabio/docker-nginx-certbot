#!/bin/sh

certbot certonly                             \
  --verbose                                  \
  --noninteractive                           \
  --standalone                               \
  --agree-tos                                \
  --email "yury.egorenkov@gmail.com"         \
  -d "icox.me"                            && \
crond                                     && \
nginx -g 'pid /tmp/nginx.pid; daemon off;'