# Setup (Docker First)

The default learning mode needs only Docker + a browser.

## Option A — Docker run (recommended)

1. Install and start **Docker Desktop** (Windows/macOS) or **Docker Engine** (Linux).
2. Pull and run the tutorial:
   ```bash
   docker run --rm -p 5000:5000 focuslog/hello-web:latest
   ```
   Class labs pinned to a semester version use:
   ```bash
   docker run --rm -p 5000:5000 focuslog/hello-web:1.0
   ```
3. Open **http://localhost:5000**.

Stop with `Ctrl+C` (or `docker stop`). Nothing is installed on your
computer besides the image layers; no host files are changed.

## If port 5000 is busy

macOS AirPlay often owns port 5000. Use another host port:

```bash
docker run --rm -p 5001:5000 focuslog/hello-web:latest
```

Then open **http://localhost:5001**.

## If Docker won't start

- Start the Docker Desktop app and wait for "Engine running".
- On Linux, check `docker info` works; you may need your admin to enable virtualization.
- Lab machines without admin rights: ask the lab to pre-pull
  `focuslog/hello-web:1.0` once, or fall back to Option B below.

## Option B — No Docker fallback

Open any file under `examples/` directly in your browser (double-click).
You lose guided navigation but every experiment still runs — early examples
are single self-contained HTML files.

## Option C — Maintainer local build (not for students)

Maintainers with Python can preview docs without Docker:

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

Students should ignore this path — the container is the supported way to learn.
