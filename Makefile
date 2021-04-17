
# VARIABLES
IMAGE_NAME = bygui86/kubectl
CONTAINER_NAME = kubectl


# CONFIG
.PHONY: help print-variables
.DEFAULT_GOAL = help


# ACTIONS

## cointaier

__check-tag :
	@[ "$(CONTAINER_TAG)" ] || ( echo "Missing container tag (CONTAINER_TAG), please define it and retry"; exit 1 )

build :		## Build container
	# 1.17.17
	docker build . -f Dockerfile -t $(IMAGE_NAME):v1.17.17 --build-arg KUBECTL_VERSION=v1.17.17
	docker build . -f Dockerfile.alpine -t $(IMAGE_NAME):v1.17.17-alpine --build-arg KUBECTL_VERSION=v1.17.17
	# 1.18.18
	docker build . -f Dockerfile -t $(IMAGE_NAME):v1.18.18 --build-arg KUBECTL_VERSION=v1.18.18
	docker build . -f Dockerfile.alpine -t $(IMAGE_NAME):v1.18.18-alpine --build-arg KUBECTL_VERSION=v1.18.18
	# 1.19.10
	docker build . -f Dockerfile -t $(IMAGE_NAME):v1.19.10 --build-arg KUBECTL_VERSION=v1.19.10
	docker build . -f Dockerfile.alpine -t $(IMAGE_NAME):v1.19.10-alpine --build-arg KUBECTL_VERSION=v1.19.10
	# 1.20.6
	docker build . -f Dockerfile -t $(IMAGE_NAME):v1.20.6 --build-arg KUBECTL_VERSION=v1.20.6
	docker build . -f Dockerfile.alpine -t $(IMAGE_NAME):v1.20.6-alpine --build-arg KUBECTL_VERSION=v1.20.6
	# 1.21.0
	docker build . -f Dockerfile -t $(IMAGE_NAME):v1.21.0 --build-arg KUBECTL_VERSION=v1.21.0
	docker build . -f Dockerfile.alpine -t $(IMAGE_NAME):v1.21.0-alpine --build-arg KUBECTL_VERSION=v1.21.0
	# latest
	docker build . -f Dockerfile.latest -t $(IMAGE_NAME):latest
	docker build . -f Dockerfile.alpine.latest -t $(IMAGE_NAME):latest-alpine

push :		## Push container to container registry
	# 1.17.17
	docker push $(IMAGE_NAME):v1.17.17
	docker push $(IMAGE_NAME):v1.17.17-alpine
	# 1.18.18
	docker push $(IMAGE_NAME):v1.18.18
	docker push $(IMAGE_NAME):v1.18.18-alpine
	# 1.19.10
	docker push $(IMAGE_NAME):v1.19.10
	docker push $(IMAGE_NAME):v1.19.10-alpine
	# 1.20.6
	docker push $(IMAGE_NAME):v1.20.6
	docker push $(IMAGE_NAME):v1.20.6-alpine
	# 1.21.0
	docker push $(IMAGE_NAME):v1.21.0
	docker push $(IMAGE_NAME):v1.21.0-alpine
	# latest
	docker push $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):latest-alpine

run : __check-tag		## Run container
	docker run -d --rm --name $(CONTAINER_NAME) $(IMAGE_NAME):$(CONTAINER_TAG)

exec :		## Open bash in container
	docker exec -ti $(CONTAINER_NAME) bash

stop :		## Stop container
	docker container stop $(CONTAINER_NAME)


## helpers

help :		## Help
	@echo ""
	@echo "*** \033[33mMakefile help\033[0m ***"
	@echo ""
	@echo "Targets list:"
	@grep -E '^[a-zA-Z_-]+ :.*?## .*$$' $(MAKEFILE_LIST) | sort -k 1,1 | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ""

print-variables :		## Print variables values
	@echo ""
	@echo "*** \033[33mMakefile variables\033[0m ***"
	@echo ""
	@echo "- - - makefile - - -"
	@echo "MAKE: $(MAKE)"
	@echo "MAKEFILES: $(MAKEFILES)"
	@echo "MAKEFILE_LIST: $(MAKEFILE_LIST)"
	@echo "- - -"
	@echo ""
