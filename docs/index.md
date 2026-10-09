# Hello Web — Build Your First Webpage Today

A friendly, hands-on tutorial that teaches **HTML, CSS, and JavaScript** to
first-year engineering students starting from absolute zero. Every lesson
produces something you can **see in your browser**.

No Python, MkDocs, or Node.js on your computer. You need only
**Docker + a web browser**.

## Start in 3 steps

```bash
docker run --rm -p 5000:5000 focuslog/hello-web:latest
```

1. Install Docker Desktop (or Docker Engine) and start it.
2. Run the command above. (For class labs pinned to a semester version, use `focuslog/hello-web:1.0` instead of `latest`.)
3. Open **http://localhost:5000** in your browser and start Mission 1.

!!! tip "Port 5000 busy? (common on macOS)"
    Run `docker run --rm -p 5001:5000 focuslog/hello-web:latest`
    and open **http://localhost:5001** instead.

!!! note "No Docker? No admin rights?"
    You can still learn: open any file under `examples/` directly in your
    browser (double-click it). You lose the guided navigation but keep the
    experiments. See [Setup](getting-started/setup.md).

## Mission roadmap

| Mission | What you build | Badge |
|---|---|---|
| 1. First webpage | Heading + paragraph + link, opened in a browser | Explorer |
| 2. Style artist | Profile card with colors, borders, spacing | Markup Maker → Style Artist |
| 3. Beat the computer | Number-guessing game with variables + conditions | Logic Builder |
| 4. Create a quiz | Self-contained mini-project combining all three | Interaction Engineer |
| Finale | Independent challenge + responsive portfolio | Web Creator |

Each mission is a series of short, independently runnable experiments.
Full code is shown for demos; challenges give requirements + hints and keep
solutions separate.

## How this site is organized

- **Getting Started** — prerequisites, Docker setup, how to learn.
- **Parts 1–7** — web basics → HTML → CSS → JavaScript → DOM → games → challenges.
- **Guides** — optional live-edit mode, version policy (`1.0` vs `latest`).
- **Appendices** — glossary, troubleshooting, skills checklist.

## Run examples

Runnable demos ship inside the same container as these docs:

- [/examples/html/](/examples/html/) — HTML exercises
- [/examples/css/](/examples/css/) — CSS exercises
- [/examples/javascript/](/examples/javascript/) — JavaScript exercises
- [/examples/mini-games/](/examples/mini-games/) — mini-games

Every lesson links **Run Example** (open it live) and **View Source**
(inspect how it works). Early examples are single self-contained files with
no libraries, backends, or build steps.
