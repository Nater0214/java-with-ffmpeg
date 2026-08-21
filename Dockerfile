ARG JAVA_VERSION=21
FROM eclipse-temurin:${JAVA_VERSION}-jre-alpine

# Install stuff
RUN apk add --no-cache \
    ffmpeg \
    curl \
    ca-certificates \
    openssl \
    git \
    tar \
    sqlite \
    fontconfig \
    tzdata \
    iproute2 \
    bash

# Create the Pterodactyl container user
RUN adduser -D -h /home/container -s /bin/bash -u 988 container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]