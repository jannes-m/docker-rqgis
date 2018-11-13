FROM robinlovelace/geocompr
MAINTAINER "Jannes Muenchow" malnamalja@gmx.de

RUN apt-get install -y gpg && \
  sh -c 'echo "deb http://qgis.org/debian-ltr stretch main" >> /etc/apt/sources.list' && \
  sh -c 'echo "deb-src http://qgis.org/debian-ltr stretch main" >> /etc/apt/sources.list' && \
  wget -O - https://qgis.org/downloads/qgis-2017.gpg.key | gpg --no-tty --import && \
  gpg --export --armor --no-tty --yes CAEB3DC3BDF7FB45 | apt-key add - && \
  apt-get update -y &&  \
  apt-get install -qqy --no-install-recommends --fix-missing \
  qgis \
  python-qgis \
  qgis-plugin-grass \
  xvfb \
  python-pip \
  xserver-xephyr \
  vnc4server && \
  pip install pyvirtualdisplay

ENV DISPLAY=:99
