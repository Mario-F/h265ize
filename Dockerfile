FROM jrottenberg/ffmpeg:4.2-alpine

COPY . /code/
RUN apk add --no-cache --update-cache git nodejs nodejs-npm && \
    cd /code && npm install --global --no-optional && \
    apk del git && \
    mkdir /input && mkdir /output

VOLUME ["/input", "/output"]
WORKDIR /h265ize

ENTRYPOINT ["/usr/bin/h265ize", "/input", "-d", "/output"]
