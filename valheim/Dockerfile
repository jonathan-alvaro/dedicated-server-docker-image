FROM steamcmd/steamcmd:ubuntu as builder
LABEL maintainer="Jonathan Alvaro"
ARG DEBIAN_FRONTEND="noninteractive"

RUN apt update -y
RUN apt install -y libatomic1 libpulse-dev libpulse0
RUN apt upgrade -y

WORKDIR /

ENV INSTALL_DIR="/valheim"
RUN mkdir -p ${INSTALL_DIR}

ARG APP_ID=896660
RUN steamcmd \
      +force_install_dir ${INSTALL_DIR} \
      +login anonymous \
      +app_update ${APP_ID} ${STEAM_BEATS} validate \
      +app_update 1007 validate \
      +quit

WORKDIR ${INSTALL_DIR}

RUN mkdir -p server-data

COPY startup.sh ${INSTALL_DIR}

ENTRYPOINT ["./startup.sh"]