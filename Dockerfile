FROM alpine:latest

ARG UID=1000
ARG GID=1000
ENV HOME=/tmp \
    SRC_PATH=/usr/src \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8


WORKDIR /opt

RUN addgroup -S -g ${GID} sshuser; \
    adduser -S -D -u ${UID} -G sshuser sshuser; \
    apk update; \
    apk add bash; \
    apk add wget curl jq; \
    apk del --purge build-dependencies; \
    mkdir -p "${SRC_PATH}"; \
    chown -R sshuser:sshuser "${SRC_PATH}"; \
    chmod -R 777 "${SRC_PATH}";

COPY --chown=sshuser:sshuser bin/ /usr/bin/

WORKDIR ${SRC_PATH}

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/bin/bash"]