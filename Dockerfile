FROM alpine:3.7

ENV AWSCLI_VERSION=1.16.263
ENV SAM_VERSION=0.22.0

RUN apk add --no-cache g++ python3-dev libffi-dev openssl-dev py-setuptools ca-certificates groff less bash make jq gettext-dev curl wget zip git

RUN  apk add --no-cache --update python3 && \
     pip3 install --upgrade pip setuptools

RUN pip3 --no-cache-dir install awscli==$AWSCLI_VERSION aws-sam-cli==$SAM_VERSION && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

COPY scripts /opt/scripts

ENV PATH "$PATH:/opt/scripts"

WORKDIR /work

ENTRYPOINT [ "aws" ]

CMD [ "--version" ]
