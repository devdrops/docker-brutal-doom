FROM ubuntu:16.04

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
    apt-get install python-software-properties -y

RUN apt-add-repository 'deb http://debian.drdteam.org/ stable multiverse' && \
    wget -O - http://debian.drdteam.org/drdteam.gpg | sudo apt-key add -

RUN apt-get install zandronum

RUN mkdir -p ~/.bin ~/.local/share/zandronum && \
    mv /sources/brutal_doom.sh ~/.bin/brutal_doom.sh && \
    chmod +x ~/.bin/brutal_doom.sh `xdg-user-dir DESKTOP`/Brutal_Doom.desktop
