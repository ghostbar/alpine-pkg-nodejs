FROM resnullius/alpine:3.5

COPY ./pkgs/ /opt/repositories/

RUN echo '/opt/repositories' >> /etc/apk/repositories && \
  apk --update add --allow-untrusted nodejs
