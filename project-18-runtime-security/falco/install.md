## Validation Test - Interactive Shell Detection

Falco successfully detected an interactive shell spawned inside an nginx container.

Alert observed:

```text
Notice A shell was spawned in a container with an attached terminal
process=bash
user=root
container_name=nginx
container_image_repository=docker.io/library/nginx
k8s_pod_name=nginx
k8s_ns_name=default

## Validation Test - Interactive Shell Detection

Falco successfully detected an interactive shell spawned inside an nginx container.

Command executed:

```bash
kubectl exec -it nginx -- /bin/bash

Notice A shell was spawned in a container with an attached terminal
process=bash
user=root
container_name=nginx
container_image_repository=docker.io/library/nginx
container_image_tag=latest
k8s_pod_name=nginx
k8s_ns_name=default
