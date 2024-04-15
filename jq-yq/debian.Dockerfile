
# base image
## 12.5-slim/bookworm-slim - amd64
FROM debian:12.5-slim@sha256:3d5df92588469a4c503adbead0e4129ef3f88e223954011c2169073897547cac

# args
ARG KUBECTL_VERSION

# install packages
RUN apt-get update -qqy && \
	apt-get upgrade -qqy && \
	apt-get install -qqy \
		ca-certificates \
		curl \
		jq \
		yq && \
	apt-get autoclean && \
	rm -rf /var/lib/apt/lists/*

# install kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
RUN curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
	curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256" && \
	echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check && \
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
	kubectl version --client

# set current dir
WORKDIR /usr/local/bin

# set user
USER 1001

# run
# ENTRYPOINT ["/bin/sh", "-c", "while :; do echo 'going to sleep for an hour, see ya later...'; sleep 3600; done"]
ENTRYPOINT "kubectl"
CMD "help"
