# ---- Build stage: render MkDocs to static files ----
FROM python:3.12-slim AS builder
WORKDIR /build

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY mkdocs.yml ./
COPY docs/ ./docs/
RUN mkdocs build --strict

# ---- Runtime stage: minimal static server, no Python ----
FROM nginx:1.27-alpine AS runtime

# Custom config serves docs at / and examples at /examples/... on :5000
COPY nginx.conf /etc/nginx/nginx.conf

# Static site + runnable examples
COPY --from=builder /build/site/ /usr/share/nginx/html/
COPY examples/ /usr/share/nginx/html/examples/

# Harden: non-root runtime user owns served files; only port 5000 exposed
RUN addgroup -S web && adduser -S web -G web \
  && chown -R web:web /usr/share/nginx/html /var/cache/nginx /var/run /var/log/nginx \
  && chmod -R 755 /usr/share/nginx/html
USER web

EXPOSE 5000

# Foreground server; nginx handles SIGTERM cleanly on `docker stop`
CMD ["nginx", "-g", "daemon off;"]
