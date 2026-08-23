FROM fedora:44

# Set by BuildKit from the target platform. Must stay without a default value:
# a default shadows the platform value and every arch would get the same binary.
ARG TARGETARCH

RUN dnf update -y \
    && dnf install -y nvme-cli \
    && dnf clean all

COPY dist/linux_${TARGETARCH}/nvme_exporter /usr/bin/nvme_exporter

EXPOSE 9998
ENTRYPOINT ["/usr/bin/nvme_exporter"]
