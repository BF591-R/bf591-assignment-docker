FROM continuumio/miniconda3
RUN apt update && apt upgrade -y
RUN apt install -y libxml2-dev libcurl4-openssl-dev libssl-dev libfontconfig1-dev \
    libharfbuzz-dev libfribidi-dev libfreetype-dev libpng-dev libtiff5-dev libjpeg-dev \
    pandoc libxt-dev
RUN apt install -y libarchive-dev
#COPY install.R /
#RUN Rscript /install.R
RUN conda install -y -c conda-forge mamba
RUN mamba install -y -c conda-forge r-tidyverse r-testthat
COPY entrypoint.sh /
COPY test.R /
COPY knit.R /
ENTRYPOINT ["bash", "/entrypoint.sh"]
