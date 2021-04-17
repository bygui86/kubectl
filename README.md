
# kubectl

Small container image with only `kubectl` installed

## Build

```bash
make build
```

## Push

```bash
make push
```

## Run

```bash
# debian
make run CONTAINER_TAG=v1.20.6
# alpine
make run CONTAINER_TAG=v1.20.6-alpine
```

## Exec

```bash
make exec
```

## Stop

```bash
make stop
```

## Links

- https://hub.docker.com/_/debian
- https://hub.docker.com/_/alpine
- https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
- https://github.com/alpine-docker/k8s/blob/master/Dockerfile
