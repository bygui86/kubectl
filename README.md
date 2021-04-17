
# kubectl

Small container image with only `kubectl` installed

## Build

```bash
make container-build CONTAINER_TAG=dev

make container-build-alpine CONTAINER_TAG=dev
```

## Push

```bash
make container-push CONTAINER_TAG=dev

make container-push-alpine CONTAINER_TAG=dev
```

## Run

```bash
make container-run CONTAINER_TAG=dev

make container-run-alpine CONTAINER_TAG=dev
```

## Exec

```bash
make container-exec
```

## Stop

```bash
make container-stop
```

## Links

- https://hub.docker.com/_/debian
- https://hub.docker.com/_/alpine
- https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
- https://github.com/alpine-docker/k8s/blob/master/Dockerfile
