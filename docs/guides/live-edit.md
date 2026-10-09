# Live-Edit Mode (Optional)

The default container is **read-only and stable**: it serves the finished
tutorial and examples. You do not need this page to start learning.

Use live-edit only when you want to change files and preview instantly
without rebuilding the image.

## What it is / is not

- Default mode: `docker run --rm -p 5000:5000 focuslog/hello-web:latest` — stable, no mounts, no host tools.
- Live-edit mode: mount your checkout into a docs preview so edits refresh. Requires a code editor on the host.

## Docs live preview (maintainers)

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

Open `http://127.0.0.1:8000`. Edit files under `docs/`; the browser reloads.

## Examples live preview (students, no Docker needed)

Edit files under `examples/` in any editor, then refresh the open browser
tab (double-clicked local file). No server, no rebuild.

## Container live preview (bind mount, advanced)

Mount the repo into a throwaway preview — never the default learning image:

```bash
docker run --rm -p 8000:8000 -v "$PWD:/work" -w /work python:3.12-slim \
  bash -lc "pip install -q -r requirements.txt && mkdocs serve -a 0.0.0.0:8000"
```

Then open `http://localhost:8000`. Stop with `Ctrl+C`.
Do not use `--privileged`, do not mount the Docker socket.
