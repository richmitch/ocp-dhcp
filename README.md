```
Warning: would violate PodSecurity "restricted:v1.24": 
allowPrivilegeEscalation != false (container "dnsmasq" must set securityContext.allowPrivilegeEscalation=false), 
unrestricted capabilities (container "dnsmasq" must set securityContext.capabilities.drop=["ALL"]), 
runAsNonRoot != true (pod or container "dnsmasq" must set securityContext.runAsNonRoot=true), 
seccompProfile (pod or container "dnsmasq" must set securityContext.seccompProfile.type to "RuntimeDefault" or "Localhost")
```

```
dnsmasq: cannot open or create lease file /etc/dnsmasq.leases: Permission denied
```

When privileged is true
```
      message: 'pods "dnsmasq-dhcp-6d45487b9d-" is forbidden: unable to validate against
        any security context constraint: [provider "anyuid": Forbidden: not usable
        by user or serviceaccount, provider "pipelines-scc": Forbidden: not usable
        by user or serviceaccount, spec.containers[0].securityContext.privileged:
        Invalid value: true: Privileged containers are not allowed, provider "restricted":
        Forbidden: not usable by user or serviceaccount, provider "nonroot-v2": Forbidden:
        not usable by user or serviceaccount, provider "nonroot": Forbidden: not usable
        by user or serviceaccount, provider "hostmount-anyuid": Forbidden: not usable
        by user or serviceaccount, provider "machine-api-termination-handler": Forbidden:
        not usable by user or serviceaccount, provider "hostnetwork-v2": Forbidden:
        not usable by user or serviceaccount, provider "hostnetwork": Forbidden: not
        usable by user or serviceaccount, provider "hostaccess": Forbidden: not usable
        by user or serviceaccount, provider "nfd-worker": Forbidden: not usable by
        user or serviceaccount, provider "node-exporter": Forbidden: not usable by
        user or serviceaccount, provider "privileged": Forbidden: not usable by user
        or serviceaccount]'
```

dnsmasq: cannot open or create lease file /var/lib/dnsmasq/dnsmasq.leases: Permission denied