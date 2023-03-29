# DHCP Server in OpenShift
Deploys dnsmasq in a container with only the DHCP server enabled and configured.  This is a work in progress

## Implementation Details
### DHCP Configuration
The `ConfigMap` contains the DHCP lease configuration and the leases are stored in a file provided by the `PersistentVolumeClaim`.  This currently relies on local storage as I'm running this in my single node lab.

### Container Image
The dnsmasq image is created using the tools container from the Red Hat ubi8 image.  See the `Dockerfile` and `BuildConfig` for details.

## Deployment
Deployment is done using kustomize and there are two overlays provided for testing, one for a single replica and one with no replicas.

I'm currently deploying it using the `oc` CLI and have added an OpenShift GitOps `Application` that can be used as an alternative.

```bash
[richmitch@asuspn50 ocp-dhcp]$ oc apply -k manifests/overlays/replicas-1
namespace/dnsmasq created
configmap/dnsmasq-dhcp created
service/dnsmasq-dhcp created
persistentvolumeclaim/dnsmasq-dhcp-leases-pvc created
Warning: would violate PodSecurity "restricted:v1.24": allowPrivilegeEscalation != false (container "dnsmasq" must set securityContext.allowPrivilegeEscalation=false), unrestricted capabilities (container "dnsmasq" must set securityContext.capabilities.drop=["ALL"]), runAsNonRoot != true (pod or container "dnsmasq" must set securityContext.runAsNonRoot=true), seccompProfile (pod or container "dnsmasq" must set securityContext.seccompProfile.type to "RuntimeDefault" or "Localhost")
deployment.apps/dnsmasq-dhcp created
buildconfig.build.openshift.io/dnsmasq-build created
imagestream.image.openshift.io/dnsmasq created
```

Note that this may need to run privileged and I haven't yet figured out whether that's needed or I can get rid of the warning.