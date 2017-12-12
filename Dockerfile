 FROM node:8-alpine

RUN apk add --no-cache \
    bash \
    curl \
    wget \
    zip  \
    unzip \
    ca-certificates 

RUN npm install pm2 -g


WORKDIR /var/www/cezerin

EXPOSE 3000
CMD ["pm2", "start", "process.json", "--no-daemon"]
# the --no-daemon is a minor workaround to prevent the docker container from thinking pm2 has stopped running and ending itself
