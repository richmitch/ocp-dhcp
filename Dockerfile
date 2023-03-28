FROM registry.access.redhat.com/ubi8/ubi:latest
RUN yum -y update && \
    yum -y install dnsmasq && \
    yum clean all
EXPOSE 67/udp
ENTRYPOINT ["dnsmasq", "-d"]