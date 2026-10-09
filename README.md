# Hello Web — Interactive Web Development for Freshers

Browser-first tutorial: HTML, CSS, and JavaScript for absolute beginners.
Students need only **Docker + a browser**.

## Students: start here

```bash
docker run --rm -p 5000:5000 focuslog/hello-web:latest
```

Open **http://localhost:5000**. Labs pinned to a semester use
`focuslog/hello-web:1.0` instead. Port busy? Use `-p 5001:5000` and open
`http://localhost:5001`. Full guide in `docs/getting-started/setup.md`.

No Docker? Open any file under `examples/` directly in a browser.

## Maintainers: docs development

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve   # preview at http://127.0.0.1:8000
mkdocs build   # outputs static site to site/
```

Do not claim the build succeeds unless `mkdocs build` has actually passed.

## Maintainers: Docker learning environment

```bash
docker build -t focuslog/hello-web:1.0 .
docker run --rm -p 5000:5000 focuslog/hello-web:1.0
# open http://localhost:5000
```

The image is multi-stage: Python+MkDocs builds `site/`, then Nginx serves
`site/` + `examples/` on `0.0.0.0:5000`. Publishing to Docker Hub
(`:1.0` + `:latest`, amd64+arm64) happens from GitHub Actions — see
`.github/workflows/docker-publish.yml` and `docs/guides/version-policy.md`.

## Repo layout

```
.
├── Dockerfile            # multi-stage: mkdocs build → nginx static on :5000
├── .dockerignore
├── nginx.conf            # docs at /, examples at /examples/...
├── mkdocs.yml
├── requirements.txt
├── README.md
├── DOCKERHUB.md          # Docker Hub repo README mirror
├── docs/                 # tutorial source (MkDocs Material)
└── examples/             # runnable HTML/CSS/JS (also served by container)
    ├── html/ css/ javascript/ mini-games/
```

## OpenSpec

Planning artifacts live in `openspec/changes/hello-web/`
(proposal → specs → design → tasks). Implementation follows `tasks.md`.
