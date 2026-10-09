# focuslog/hello-web

Interactive web development tutorial for engineering freshers — HTML, CSS,
and JavaScript taught through small runnable browser experiments.

## Run it (students)

```bash
docker run --rm -p 5000:5000 focuslog/hello-web:latest
```

Open **http://localhost:5000**. Labs pinned to a semester use
`focuslog/hello-web:1.0`. Port busy? Use `-p 5001:5000` → `http://localhost:5001`.

## Tags

- `latest` — moving quick-start for day one.
- `1.0` — pinned semester version; immutable after class freeze (fixes ship as new versions).

Both tags are multi-arch (`linux/amd64`, `linux/arm64`).

## What it does / does not do

- Serves the tutorial website plus runnable `/examples/...` on port 5000.
- Needs no accounts, databases, or host-installed Python/Node.
- Does not collect data, require privileged flags, or write to your files.
- Stops cleanly with `Ctrl+C` / `docker stop`.

## Source

Built from this repo: `Dockerfile` (MkDocs build → Nginx static on `:5000`).
Free Docker Hub accounts can host public repos like this one.
