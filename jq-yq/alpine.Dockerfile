
# base image
## amd64
FROM alpine:3.19.1@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b

# args
ARG KUBECTL_VERSION

# install packages
RUN apk update --no-cache && \
	apk add --no-cache \
		ca-certificates \
		curl \
		bash \
		jq \
		yq && \
	rm -rf /var/cache/apk/*

# set current dir
WORKDIR /usr/local/bin

# install kubectl
	# mv kubectl /usr/local/bin/kubectl && \
RUN curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
	chmod +x /usr/local/bin/kubectl

# TODO update path
# ENV PATH "${PATH}:/usr/local/bin"

# set user
USER 1001

# run
# ENTRYPOINT ["/bin/sh", "-c", "while :; do echo 'going to sleep for an hour, see ya later...'; sleep 3600; done"]
ENTRYPOINT "kubectl"
CMD "help"
