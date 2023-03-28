FROM registry.redhat.io/ubi8/ubi:latest
RUN yum -y install dnsmasq && \
    yum clean all
EXPOSE 67/udp
ENTRYPOINT ["dnsmasq", "-d"]