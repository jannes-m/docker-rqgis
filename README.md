
<!-- README.md is generated from README.Rmd. Please edit that file -->

### Run RStudio, RQGIS, geocompr and QGIS in a Docker container

**Linux users**: Updating the Linux kernel to version 4.19 introduced an
`dpkg`/`overlayfs` Docker issue. As pointed out by this
[post](https://github.com/docker/for-linux/issues/480), you can make
Docker work again with the updated Linux kernel when running the
following command on your shell prior to any docker command:

``` sh
echo N | sudo tee /sys/module/overlay/parameters/metacopy
```

Then we can clone the `docker-rqgis` repository and build the
corresponding image:

``` sh
# clone the repository
git clone https://github.com/jannes-m/docker-rqgis.git
# navigate to the cloned directory
cd docker-rqgis
# build the docker image, and name it rqgis
sudo docker build -t rqgis .  
```

Now you can start R either from the Shell…

``` r
# start the container from the shell
docker run -it rqgis /bin/bash
# start R
R
```

… or using RStudio

``` r
sudo docker run -e PASSWORD=pass -p 8787:8787 rqgis
```

Open <http://localhost:8787> and use `rstudio` as usernmae and `pass` as
password. Next, we have to attach the **RQGIS** package but before we
can run any **RQGIS** commands, we have to make sure that PyQt will work
even without a display. I found the solution for this
[here](https://stackoverflow.com/questions/12462796/running-a-pyqt4-script-without-a-display)
and
[here](https://gis.stackexchange.com/questions/258998/pyqgis-problem-with-gui-on-linux).

``` r
library("RQGIS")
#> Loading required package: reticulate

# add virtual display
py_run_string("from pyvirtualdisplay import Display")
py_run_string("display = Display(visible=False, size=(1024, 768), color_depth=24)")
py_run_string("display.start()")
```

Now you can run RQGIS commands, e.g.:

``` r
qgis_session_info()
#> Assuming that your root path is '/usr'!
#> $qgis_version
#> [1] "2.18.25"
#> 
#> $gdal
#> [1] "2.1.2"
#> 
#> $grass6
#> [1] FALSE
#> 
#> $grass7
#> [1] "7.2.0"
#> 
#> $saga
#> [1] "2.3.1"
```
