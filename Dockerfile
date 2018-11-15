FROM robinlovelace/geocompr
MAINTAINER Jannes Muenchow <malnamalja@gmx.de>

RUN apt-get install -y gpg && \
  # install QGIS and dependencies
  sh -c 'echo "deb http://qgis.org/debian-ltr stretch main" >> /etc/apt/sources.list' && \
  sh -c 'echo "deb-src http://qgis.org/debian-ltr stretch main" >> /etc/apt/sources.list' && \
  wget -O - https://qgis.org/downloads/qgis-2017.gpg.key | gpg --no-tty --import && \
  gpg --export --armor --no-tty --yes CAEB3DC3BDF7FB45 | apt-key add - && \
  apt-get update && apt-get install -qqy --no-install-recommends --fix-missing \
  python-pip \
  qgis \
  python-qgis \
  qgis-plugin-grass \
  # needed for virtual display
  xvfb \
  vnc4server \
  # install SAGA 2.3.1
  saga && \ 
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*  && \
  # needed for virtual display
  pip install pyvirtualdisplay


