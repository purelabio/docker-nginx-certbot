FROM alpine

RUN apk add --update nginx certbot openssl

# TODO Extract email and server name into a variables
ADD default.conf.template /etc/nginx/conf.d/default.conf.template

WORKDIR /opt/certbot

# https://man.cx/run-parts(8)
#
#  > ... run−parts runs all the executable files ...
#  > ... names must consist entirely of ASCII upper- and lower-case letters,
#  >     ASCII digits, ASCII underscores, and ASCII minus-hyphens ...
#
ADD renew.sh /etc/periodic/daily/renew
RUN chmod +x /etc/periodic/daily/*

ADD run.sh .

RUN chmod +x run.sh

# Run the command on container startup
CMD ["./run.sh"]
