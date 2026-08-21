ARG JAVA_VERSION=21
FROM eclipse-temurin:${JAVA_VERSION}-jre-alpine

RUN apk add --no-cache ffmpeg

RUN java -version && ffmpeg -version