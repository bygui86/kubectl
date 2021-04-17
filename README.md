
# kubectl

Small container image with only `kubectl` installed

## Build

```bash
make container-build

make container-build-alpine
```

## Push

```bash
make container-push

make container-push-alpine
```

## Run

```bash
make container-run

make container-run-alpine
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
