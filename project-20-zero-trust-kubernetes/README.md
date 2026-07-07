## Validation Evidence

The following Kubernetes NetworkPolicies were created:

- default-deny-all
- allow-dns-egress
- allow-frontend-to-backend-egress
- allow-frontend-to-backend-ingress
- allow-backend-tier-to-database-egress
- allow-backend-tier-to-database-ingress

Calico components were installed and running:

- calico-kube-controllers
- calico-node

Application pods were running with the expected labels:

- frontend
- backend
- backend-tester
- database

## Important Finding

Kubernetes NetworkPolicy resources were successfully created. However, during validation, the expected deny rule for `frontend → database` was not enforced in this EKS lab environment.

This demonstrates an important production lesson:

> NetworkPolicy enforcement depends on the Kubernetes CNI and network policy engine configuration, not only on the manifest definitions.

## Expected Zero Trust Flow

- frontend → backend: allowed
- backend → database: allowed
- frontend → database: expected to be denied

## Lesson Learned

In real production environments, Zero Trust Kubernetes networking requires:

- Correct NetworkPolicy manifests
- A compatible network policy engine
- Proper CNI enforcement
- Validation testing after deployment
