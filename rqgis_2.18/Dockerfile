FROM robinlovelace/geocompr
MAINTAINER Jannes Muenchow <malnamalja@gmx.de>

# install RQGIS from github (pyvirtualdisplay)
RUN R -e "remotes::install_github('jannes-m/RQGIS')"

ENV LANG C

COPY build /build/scripts
RUN chmod +x /build/scripts/get_deps.sh && \
  chmod +x /build/scripts/get_code.sh && \
  chmod +x /build/scripts/make.sh && \
  chmod +x /build/scripts/clean.sh && \
  /bin/bash -c /build/scripts/get_deps.sh && \
  /bin/bash -c /build/scripts/get_code.sh && \
  /bin/bash -c /build/scripts/make.sh && \
  /bin/bash -c /build/scripts/clean.sh

# RUN chmod +x /build/scripts/install.sh
#RUN chmod +x /build/scripts/get_deps.sh && \
#    chmod +x /build/scripts/get_code.sh && \
#    chmod +x /build/scripts/make.sh && \
#    chmod +x /build/scripts/clean.sh



