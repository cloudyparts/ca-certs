FROM buildpack-deps:curl

MAINTAINER Patrick Devlin <pdevlin@stdio.cloud> (@cloudyparts)

VOLUME /assets

RUN    DEBIAN_FRONTEND=noninteractive apt-get --quiet --yes update \
    && DEBIAN_FRONTEND=noninteractive apt-get --quiet --yes install ca-certificates

CMD ["cp", "/etc/ssl/certs/ca-certificates.crt", "/assets/ca-certificates.crt"]
