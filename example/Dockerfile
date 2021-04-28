FROM ghcr.io/unlog-app/docker-deno:v1.9.2

EXPOSE 8080

USER nonroot

WORKDIR /app

COPY ./deps.ts .
RUN ["deno", "cache", "deps.ts"]

COPY . .
RUN ["deno", "cache", "mod.ts"]

CMD ["run", "--allow-net", "mod.ts"]
