
# base image
# debian:10-slim/buster-slim
FROM debian@sha256:b586cf8c850cada85a47599f08eb34ede4a7c473551fd7c68cbf20ce5f8dbbf1

# args
ARG KUBECTL_VERSION=v1.21.0

# install packages
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y apt-transport-https ca-certificates curl && \
	rm -rf /var/lib/apt/lists/*

# install kubectl
RUN curl -sLO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
	mv kubectl /usr/bin/kubectl && \
	chmod +x /usr/bin/kubectl

# set current dir
WORKDIR /usr/bin

# set user
USER 1001

# entrypoint
ENTRYPOINT ["/bin/sh", "-c", "while :; do echo 'going to sleep for an hour, see ya later...'; sleep 3600; done"]
