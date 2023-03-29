# DHCP Server in OpenShift
Deploys dnsmasq in a container with only the DHCP server enabled and configured.  This is a work in progress

## Implementation Details
### DHCP Configuration
The `ConfigMap` contains the DHCP lease configuration and the leases are stored in a file provided by the `PersistentVolumeClaim`.  This currently relies on local storage as I'm running this in my single node lab.

### Container Image
The dnsmasq image is created using the tools container from the Red Hat ubi8 image.  See the `Dockerfile` and `BuildConfig` for details.

## Deployment
Deployment is done using kustomize and there are two overlays provided for testing, one for a single replica and one with no replicas.