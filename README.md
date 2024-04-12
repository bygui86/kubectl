
# kubectl

Small container image with only `kubectl` installed.

## Build

```bash
task build-latest

task build-specific KUBECTL_VERSION=v1.28.4
```

## Push

```bash
task push-latest

task push-specific KUBECTL_VERSION=v1.28.4
```

## Build & Push

```bash
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
