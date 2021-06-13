FROM ghcr.io/georgzepf/docker-deno:v1.11.0

EXPOSE 8080

USER nonroot

WORKDIR /app

COPY ./deps.ts .
RUN ["deno", "cache", "deps.ts"]

COPY . .
RUN ["deno", "cache", "mod.ts"]

CMD ["run", "--allow-net", "mod.ts"]
