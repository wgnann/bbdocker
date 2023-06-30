# fortemente inspirado em https://github.com/farribeiro/wscef-docker
FROM debian:bullseye-slim

RUN apt-get update \
  && apt-get -y --no-install-recommends install firefox-esr locales xauth

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup64.deb /root/warsaw.deb
RUN rm /bin/systemctl && apt-get -y --no-install-recommends install /root/warsaw.deb

COPY startup.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/startup.sh
ENTRYPOINT /usr/local/bin/startup.sh
