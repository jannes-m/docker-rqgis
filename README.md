
<!-- README.md is generated from README.Rmd. Please edit that file -->

### Run RStudio, RQGIS and QGIS in a Docker container

``` sh
# clone the repository
git clone https://github.com/jannes-m/docker-rqgis.git
# navigate to the cloned directory
cd docker-rqgis
# build the docker image, and name it rqgis
sudo docker build -t rqgis .  
# start the image from the shell
docker run -it rqgis /bin/bash
# virtual display 
Xvfb :99 -ac -noreset &
# start R
R
```

Now you can run R commands, e.g.:

``` r
library("RQGIS")
#> Loading required package: reticulate
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
#> NULL
```
