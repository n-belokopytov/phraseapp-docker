FROM python:<2.7>-alpine

ENV VERSION 1.7.4

RUN set -ex \
    && apk add --no-cache ca-certificates \
    git \
    jq \
    util-linux

RUN set -ex \
        && apk add --no-cache --virtual .phraseapp-build \
                curl \
        && curl -fSL -o /usr/local/bin/phraseapp "https://github.com/phrase/phraseapp-client/releases/download/${VERSION}/phraseapp_linux_amd64" \
        && chmod +x /usr/local/bin/phraseapp \
	&& apk del .phraseapp-build
