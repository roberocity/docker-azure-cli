FROM alpine:latest

RUN apk update && \
    apk upgrade

RUN apk add gcc libffi-dev musl-dev \
            openssl openssl-dev make \
            python3 python3-dev py-pip && \
    pip --no-cache-dir install -U pip && \
    pip --no-cache-dir install azure-cli && \
    apk del --purge python3-dev gcc \
                    musl-dev make
