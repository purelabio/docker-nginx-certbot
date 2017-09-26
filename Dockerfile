FROM alpine

RUN apk add --update nginx certbot openssl

# TODO Extract email and server name into a variables
ADD default.conf /etc/nginx/conf.d/default.conf

WORKDIR /opt/certbot

ADD certbot.cron /var/spool/cron/crontabs

RUN crond -c /var/spool/cron/crontabs

ADD run.sh .

RUN chmod +x run.sh

# Run the command on container startup
CMD ["./run.sh"]
