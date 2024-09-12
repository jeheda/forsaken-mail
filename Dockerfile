FROM node:lts-alpine
MAINTAINER Hongcai Deng <admin@dhchouse.com>

WORKDIR /forsaken-mail

RUN wget https://github.com/bydioeds/forsaken-mail/archive/master.tar.gz -q -O /tmp/forsaken-mail-master.tar.gz \
    && tar zxf /tmp/forsaken-mail-master.tar.gz -C /tmp \
    && mv /tmp/forsaken-mail-master/* /forsaken-mail \
    && rm /tmp/forsaken-mail-master.tar.gz \
    && npm install --production \
    && npm cache clean --force

RUN mkdir /correos

EXPOSE 25
EXPOSE 3000
CMD ["npm", "start"]
