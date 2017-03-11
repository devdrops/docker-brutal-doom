FROM ubuntu:12.04

MAINTAINER Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>

ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="DevDrops/DockerBrutalDoom" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/devdrops/docker-brutal-doom" \
      org.label-schema.schema-version="1.0"

COPY ./sources /sources

RUN apt-get update && \
    apt-get -y install \
        curl \
        wget \
        build-essential \
        python-software-properties \
        apt-transport-https \
        apt-utils \
        unzip \
        zip \
        tar \
        libgtk2.0-0:i386 \
        libglu1-mesa:i386 && \
    apt-get -qq update

RUN apt-add-repository "deb http://debian.drdteam.org/ stable multiverse" && \
    wget -O - http://debian.drdteam.org/drdteam.gpg | apt-key add - && \
    apt-get update && \
    apt-get -y install zandronum

RUN mkdir -p ~/.bin ~/.local/share/zandronum && \
    mv /sources/brutal_doom.sh ~/.bin/brutal_doom.sh && \
    chmod +x ~/.bin/brutal_doom.sh
