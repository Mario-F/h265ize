FROM node:12-alpine

COPY . /code/
RUN apk add --no-cache --update-cache git ffmpeg && \
    cd /code && npm install --global --no-optional && \
    apk del git && \
    mkdir /input && mkdir /output

VOLUME ["/input", "/output"]
WORKDIR /h265ize

ENTRYPOINT ["/usr/local/bin/h265ize", "/input", "-d", "/output"]