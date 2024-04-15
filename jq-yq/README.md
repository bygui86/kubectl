
# kubectl + jq + yq

## Description

Small container image with only `kubectl`, `jq` and `yq` installed.

Container image bases:
- `debian`
- `alpine`

## Commands

```bash
# build
task build-latest
task build-specific KUBECTL_VERSION=v1.28.4

# push
task push-latest
task push-specific KUBECTL_VERSION=v1.28.4

# build + push
task build-push-latest
task build-push-specific KUBECTL_VERSION=v1.28.4
```

## Links

- https://hub.docker.com/r/bygui86/kubectl
- https://taskfile.dev/
- https://hub.docker.com/_/debian
- https://hub.docker.com/_/alpine
- https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
- https://kubernetes.io/releases/
- https://github.com/alpine-docker/k8s/blob/master/Dockerfile
