FROM r-base:4.3.1
RUN apt update && apt upgrade -y
# install github cli to update repo later
RUN apt install -y gh
COPY install.R /
RUN Rscript /install.R
COPY entrypoint.sh /
COPY test.R /
COPY knit.R /
ENTRYPOINT ["bash", "/entrypoint.sh"]
