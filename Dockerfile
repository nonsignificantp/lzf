FROM openjdk:20-slim

ARG COMPRESS_LZF_URL=https://repo1.maven.org/maven2/com/ning/compress-lzf/1.1/compress-lzf-1.1.jar

WORKDIR /files

RUN apt-get update \
    && apt-get install -y curl \
    && curl ${COMPRESS_LZF_URL} -o /compress-lzf.jar

ENTRYPOINT [ "java", "-jar", "/compress-lzf.jar", "-d" ]