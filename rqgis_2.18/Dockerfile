FROM rocker/geospatial
RUN R -e "remotes::install_github('r-spatial/lwgeom')"
RUN R -e "remotes::install_github('geocompr/geocompkg')"

# install RQGIS from github (pyvirtualdisplay)
RUN R -e "remotes::install_github('jannes-m/RQGIS')"

ENV LANG C

COPY build /build/scripts
RUN chmod +x /build/scripts/1_get_deps.sh && \
  chmod +x /build/scripts/2_clone_qgis.sh && \
  chmod +x /build/scripts/3_make.sh && \
  chmod +x /build/scripts/4_clean.sh && \
  /bin/bash -c /build/scripts/1_get_deps.sh && \
  /bin/bash -c /build/scripts/2_clone_qgis.sh && \
  /bin/bash -c /build/scripts/3_make.sh && \
  /bin/bash -c /build/scripts/4_clean.sh




