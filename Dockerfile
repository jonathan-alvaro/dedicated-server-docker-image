FROM steamcmd/steamcmd:ubuntu as builder
LABEL maintainer="Jonathan Alvaro"
ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update -y && \
    apt-get install -y wine-stable wine32 wine64 xvfb gosu && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /

ENV INSTALL_DIR="/vrising"
RUN mkdir -p ${INSTALL_DIR}

ARG APP_ID=1829350
RUN steamcmd \
        +force_install_dir ${INSTALL_DIR} \
        +login anonymous \
        +app_update ${APP_ID} ${STEAM_BETAS} validate \
        +app_update 1007 validate \
        +quit

WORKDIR ${INSTALL_DIR}

RUN mkdir -p server-data
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh
ENTRYPOINT ["/usr/local/bin/startup.sh"]

FROM builder as runner

ARG TINI_VERSION=v0.19.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

WORKDIR ${INSTALL_DIR}

CMD ["tini", "--", "xvfb-run", "-a", "wine", "./VRisingServer.exe", "-persistentDataPath", "./server-data"]