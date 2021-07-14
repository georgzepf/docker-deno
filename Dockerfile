FROM alpine:3.14

ENV DENO_VERSION 1.12.0
ENV DENO_INSTALL /usr/local

RUN apk add curl --no-cache --virtual .curl-package \
 && curl -fsSL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno-x86_64-unknown-linux-gnu.zip --output deno-${DENO_VERSION}.zip \
 && unzip deno-${DENO_VERSION}.zip \
 && mv deno ${DENO_INSTALL}/bin \
 && rm deno-${DENO_VERSION}.zip \
 && apk del .curl-package

FROM gcr.io/distroless/cc

ENV DENO_INSTALL /usr/local
# ENV DENO_DIR (defaults to /root/.cache/deno)
# ENV DENO_INSTALL_ROOT (defaults to /root/.deno)

COPY --from=0 ${DENO_INSTALL}/bin ${DENO_INSTALL}/bin

ENTRYPOINT ["deno"]
CMD ["--version"]
