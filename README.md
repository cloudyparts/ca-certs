> ca-certs - creates a docker base image that contains only root ca-certificates.

This is a docker base image built from `scratch` and adds root CA certificates.

### Install

```sh
docker pull cloudyparts/ca-certs
```

### Usage

```DOCKERFILE
FROM cloudyparts/ca-certs
```
