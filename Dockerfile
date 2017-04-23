FROM scratch

MAINTAINER Patrick Devlin <pdevlin@stdio.cloud> (@cloudyparts)

ADD ./assets/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
