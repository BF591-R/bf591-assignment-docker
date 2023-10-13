FROM r-base:4.3.1

RUN apt update && apt upgrade -y
RUN apt install --fix-missing -y libxml2-dev libcurl4-openssl-dev libssl-dev libfontconfig1-dev \
    libharfbuzz-dev libfribidi-dev libfreetype-dev libpng-dev libtiff5-dev libjpeg-dev \
    pandoc libxt-dev libarchive-dev libudunits2-dev libgdal-dev

# doing this ridiculousness to avoid R recompiling every uckfing package every uckfing time
RUN Rscript -e 'install.packages("Rcpp", repos="https://cloud.r-project.org")'
RUN Rscript -e 'install.packages("tidyverse", repos="https://cloud.r-project.org")'
RUN Rscript -e 'install.packages("testthat", repos="https://cloud.r-project.org")'
RUN Rscript -e 'install.packages("BiocManager", repos="https://cloud.r-project.org")'
RUN Rscript -e 'install.packages("ggVennDiagram", repos="https://cloud.r-project.org")'
RUN Rscript -e 'install.packages("kableExtra", repos="https://cloud.r-project.org")'

COPY install.R /
RUN Rscript /install.R

COPY entrypoint.sh /
COPY test.R /
COPY knit.R /
ENTRYPOINT ["bash", "/entrypoint.sh"]
