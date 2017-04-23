> ca-certs - creates a docker base image that contains only root ca-certificates.

[![build status](https://gitlab.com/cloudyparts/ca-certs/badges/master/build.svg)](https://gitlab.com/cloudyparts/ca-certs/commits/master)

This is a docker base image built from `scratch` and adds root CA certificates.

### Install

```sh
docker pull cloudyparts/ca-certs
```

### Usage

```DOCKERFILE
FROM cloudyparts/ca-certs
```
