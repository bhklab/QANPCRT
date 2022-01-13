# hash:sha256:edfbf7a9244daea546c86cf510d080bcd3b01ecdfded062d0aa245a375a608c4
FROM registry.codeocean.com/codeocean/r-base:4.0.3-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        pspp=1.0.1-1 \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'remotes::install_version("ggplot2", "3.3.3")' \
    && Rscript -e 'remotes::install_version("rms", "6.1-1")' \
    && Rscript -e 'remotes::install_version("survminer", "0.4.8")'
