FROM robinlovelace/geocompr
MAINTAINER Jannes Muenchow <malnamalja@gmx.de>

# install RQGIS3 from github
RUN R -e "remotes::install_github('jannes-m/RQGIS3')"
RUN apt-get update && \
  # software-properties-common contains add-apt-repository needed for ubuntugis
  # apt-get install -y gpg software-properties-common && \
  apt-get install -y gpg && \
  # install QGIS and dependencies
  sh -c 'echo "deb http://qgis.org/debian stretch main" >> /etc/apt/sources.list' && \
  sh -c 'echo "deb-src http://qgis.org/debian stretch main" >> /etc/apt/sources.list' && \
  # installing ubuntugis-unstable did not work
  # sh -c 'echo "deb http://qgis.org/ubuntugis-ltr xenial main" >> /etc/apt/sources.list' && \
  # sh -c 'echo "deb-src http://qgis.org/ubuntugis-ltr xenial main" >> /etc/apt/sources.list' && \
  # sh -c 'echo "deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu xenial main" >> /etc/apt/sources.list' && \
  # add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
  wget -O - https://qgis.org/downloads/qgis-2017.gpg.key | gpg --no-tty --import && \
  gpg --export --armor --no-tty --yes CAEB3DC3BDF7FB45 | apt-key add - && \
  apt-get update && apt-get install -qqy --no-install-recommends --fix-missing \
  python3-pip \
  python3-setuptools \
  python-qgis \
  qgis \
  qgis-plugin-grass \
  # install SAGA 2.3.1
  saga \
  # install libs needed for virtual display
  vnc4server \
  xvfb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*  && \
  # install virtual display for Python
  pip3 install pyvirtualdisplay

# RUN git clone --progress https://github.com/jannes-m/RQGIS3 /home/rstudio/RQGIS3
