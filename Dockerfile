FROM ubuntu:latest
ENV TZ=Europe/Warsaw
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y make git wget curl unzip cmake && \
    wget -O node.sh https://deb.nodesource.com/setup_16.x && \
    chmod +x node.sh && \
    ./node.sh && \
    apt-get update && \
    rm node.sh && \
    apt-get install --fix-missing -y nodejs && \
    npm install -g npm@8.11.0 && \
    npm install --location=global esy@0.6.11
RUN mkdir /esy
WORKDIR /esy
COPY package.json /esy/package.json
ENV ESY__BUILD_CONCURRENCY=24
ENV ESY__FETCH_CONCURRENCY=24
RUN esy # && tar -zcvf _esy.tar.gz _esy && rm -rf _esy
