FROM ubuntu:14.04


RUN  apt-get update \
  && apt-get install -y wget xz-utils\
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /opt/factorio -s /bin/bash factorio \
  && chown -R factorio.factorio /opt/factorio
USER factorio

ENV HOME /opt/factorio
ENV SAVEFILE /opt/factorio/saves/factorio_save.zip
ENV SERVER_SETTINGS /opt/factorio/data/server-settings.json
ENV MAP_SETTINGS /opt/factorio/data/map-settings.json
ENV MAP_GEN_SETTINGS /opt/factorio/data/map-gen-settings.json
WORKDIR /opt/factorio

RUN  wget -q -O /tmp/factorio.tar.gz https://www.factorio.com/get-download/latest/headless/linux64 \
  && tar -xf /tmp/factorio.tar.gz -C /opt \
  && rm -rf /tmp/factorio.tar.gz && mkdir /opt/factorio/mods

COPY mods/ /opt/factorio/mods
COPY configs/ /opt/factorio/data/
ADD  init.sh /opt/factorio/

EXPOSE 34197/udp
CMD ["./init.sh"]
