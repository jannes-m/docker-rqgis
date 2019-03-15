set -e
apt-get -y update
#apt-get install -y software-properties-common
#add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt-get -y update

apt-get install -y --fix-missing bison ca-certificates cmake dh-python doxygen \
  flex gdal-bin git graphviz grass-dev libexpat1-dev libfcgi-dev libgdal-dev \
  libgeos-dev libgsl-dev libopenscenegraph-dev libosgearth-dev libpq-dev \
  libproj-dev libqca2-dev libqca2-plugin-ossl libqjson-dev libqscintilla2-dev \
  libqt4-dev libqt4-opengl-dev libqt4-sql-sqlite libqtwebkit-dev libqwt-dev \
  libspatialindex-dev libspatialite-dev libsqlite3-dev lighttpd locales \
  pkg-config poppler-utils pyqt4-dev-tools pyqt4.qsci-dev python-all \
  python-all-dev python-future python-gdal python-mock python-nose2 \
  python-pip python-psycopg2 python-pyspatialite python-qscintilla2 python-qt4 \
  python-qt4-dev python-qt4-sql python-sip python-sip-dev python-yaml \
  qt4-dev-tools qt4-doc-html spawn-fcgi txt2tags xauth xfonts-100dpi \
  xfonts-75dpi xfonts-base xfonts-scalable xvfb cmake-curses-gui vnc4server saga

pip install --upgrade pip==9.0.3
pip install requests psycopg2 jinja2 pygments
pip install pyvirtualdisplay

chmod -R a+w /usr/lib/x86_64-linux-gnu/qt4/plugins/designer/
chmod -R a+w /usr/lib/python2.7/dist-packages/PyQt4/uic/widget-plugins/
