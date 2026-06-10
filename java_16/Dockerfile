FROM ghcr.io/pelican-eggs/yolks:java_16

USER root

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libxext6 \
    fontconfig \
    fonts-dejavu-core \
 && rm -rf /var/lib/apt/lists/*

USER container
