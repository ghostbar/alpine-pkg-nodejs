FROM resnullius/alpine:3.2

COPY ./pkgs/ /opt/repositories/

RUN echo '/opt/repositories' >> /etc/apk/repositories && \
  apk --update add --allow-untrusted nodejs
