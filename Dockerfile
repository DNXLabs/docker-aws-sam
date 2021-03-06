FROM node:12.13.1-alpine3.10

ENV AWSCLI_VERSION=1.16.263
ENV SAM_VERSION=0.36.0

RUN apk add --no-cache --update \
    g++ \
    python3-dev \
    python3 \
    libffi-dev \
    openssl-dev \
    py-setuptools \
    ca-certificates \
    groff \
    less \
    bash \
    make \
    jq \
    gettext-dev \
    curl \
    wget \
    zip \
    git && \
    pip3 install --no-cache-dir --upgrade \
        pip \
        setuptools \
        awscli==$AWSCLI_VERSION \
        aws-sam-cli==$SAM_VERSION && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

COPY scripts /opt/scripts

ENV PATH "$PATH:/opt/scripts"

WORKDIR /work

ENTRYPOINT [ "aws" ]

CMD [ "--version" ]