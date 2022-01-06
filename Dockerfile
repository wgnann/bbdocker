# fortemente inspirado em https://github.com/farribeiro/wscef-docker
FROM debian:bullseye-slim

RUN apt-get update \
  && apt-get -y --no-install-recommends install firefox-esr gdebi locales xauth

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup64.deb /root/warsaw.deb
RUN rm /bin/systemctl && gdebi -n /root/warsaw.deb

ARG USER=ff
ARG UID=1000
RUN adduser --uid $UID --disabled-password --add_extra_groups --gecos $USER $USER
RUN mkdir -p /run/user/${UID} \
  && chown ${UID}:${UID} /run/user/${UID} \
  && chmod 700 /run/user/${UID} 

COPY startup.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/startup.sh
ENTRYPOINT /usr/local/bin/startup.sh
