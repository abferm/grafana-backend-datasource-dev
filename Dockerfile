FROM golang:1.18-bullseye as dev

# Install mage
ENV MAGE_VERSION=v1.13.0
RUN cd /tmp && \
    git clone -b ${MAGE_VERSION} --depth=1 https://github.com/magefile/mage && \
    cd mage && \
    go run bootstrap.go && \
    rm -rf /tmp/mage

# Install Node 16.X (LTS)
ENV NODE_MAJOR_VERSION=16
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_MAJOR_VERSION}.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g yarn @grafana/toolkit@9.0.4

RUN apt-get update && apt-get install -y make python
