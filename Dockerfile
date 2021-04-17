
# base image
# debian:10-slim/buster-slim
FROM debian@sha256:b586cf8c850cada85a47599f08eb34ede4a7c473551fd7c68cbf20ce5f8dbbf1

# install packages
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y apt-transport-https ca-certificates curl && \
	rm -rf /var/lib/apt/lists/*

# install kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
	apt-get update -y && \
	apt-get install -y kubectl

# set current dir
WORKDIR /usr/bin

# set user
USER 1001

# entrypoint
ENTRYPOINT ["/bin/sh", "-c", "while :; do echo 'going to sleep for an hour, see ya later...'; sleep 3600; done"]
