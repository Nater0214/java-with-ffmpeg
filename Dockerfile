# Base container image
ARG JAVA_VERSION=21
FROM eclipse-temurin:${JAVA_VERSION}-jre-resolute

# Install stuff
RUN apt update && apt install -y \
    ffmpeg \
    curl \
    ca-certificates \
    openssl \
    git \
    tar \
    sqlite3 \
    fontconfig \
    tzdata \
    iproute2 \
    bash

# Create the Pterodactyl container user
RUN adduser -D -h /home/container -s /bin/bash -u 988 container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Entrypoint
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]