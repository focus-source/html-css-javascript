## 1. Documentation skeleton

- [x] 1.1 Add `mkdocs.yml` with Material theme, nav, and syntax highlighting for HTML/CSS/JS
- [x] 1.2 Add `requirements.txt` with pinned MkDocs/Material versions and verify compatibility
- [x] 1.3 Add `docs/index.md` homepage with mission roadmap and Docker quick-start (`focuslog/hello-web:latest` → `http://localhost:5000`)
- [x] 1.4 Add `docs/getting-started/` pages (prerequisites, setup, how-to-learn) with Docker-first onboarding and no-Docker fallback
- [x] 1.5 Add `docs/appendices/` glossary, troubleshooting (daemon-off, port 5000 busy → 5001, pull limits, stale cache), and skills checklist
- [x] 1.6 Add `README.md` with local `mkdocs serve`/`build` for maintainers plus student `docker run` path

## 2. Curriculum content and examples

- [x] 2.1 Create Part index pages and Chapter stubs following mission progression (web basics → HTML → CSS → JS → DOM → games/challenges)
- [x] 2.2 Create `examples/` folders (`html/`, `css/`, `javascript/`, `mini-games/`) with one verified runnable starter per area
- [x] 2.3 Add explicit `examples/<area>/` index pages listing exercises (no server auto-listing assumption)
- [x] 2.4 Wire per-lesson Run Example and View Source links to predictable `/examples/...` URLs
- [x] 2.5 Author Mission 1 demo (first webpage) with full code, run steps, expected output, and two modification tries

## 3. Docker learning environment

- [x] 3.1 Add multi-stage `Dockerfile` (MkDocs build stage → Nginx runtime copying `site/` + `examples/`, serving `0.0.0.0:5000` foreground)
- [x] 3.2 Add `.dockerignore` excluding host-only files and build artifacts
- [x] 3.3 Configure Nginx to serve docs at `/` and examples at `/examples/...` with correct MIME and SPA-free static routing
- [x] 3.4 Apply runtime hardening (expose 5000 only, non-root user when practical, no secrets, minimal files, clean SIGTERM handling)
- [x] 3.5 Document optional live-edit mode separately (bind-mount/dev profile) without changing default read-only run

## 4. Docker Hub publishing

- [x] 4.1 Add GitHub Actions publish workflow building `linux/amd64` + `linux/arm64` and pushing `focuslog/hello-web:1.0` and `latest` with digests
- [ ] 4.2 Configure Hub PAT as GitHub secrets for `focuslog` org and verify free-account public push succeeds (BLOCKED: secrets added; workflow fixed login-first, but Hub registry returns HTTP 500 to Actions runners — `registry-1.docker.io/v2/` and `auth.docker.io/token` both 500 since 21:05Z. Retried 4x. Wait for Hub throttle to clear, then rerun workflow dispatch `version=1.0`. If login then 401s, the PAT is wrong — regenerate with write access to `focuslog/hello-web`.)
- [x] 4.3 Publish Hub README mirroring homepage (what image does, run command, tags, what it does not do)
- [x] 4.4 Freeze `1.0` policy docs (immutable after class start, fixes as new versions, `latest` rolls forward)

## 5. Verification and release

- [x] 5.1 Verify `docker build -t focuslog/hello-web:1.0 .` succeeds from clean checkout
- [x] 5.2 Verify clean-machine `docker run --rm -p 5000:5000 focuslog/hello-web:1.0` and `:latest` serve homepage at `http://localhost:5000`
- [x] 5.3 Verify all Parts/Chapters reachable, internal links work, CSS/JS assets load, interactive examples function
- [ ] 5.4 Verify `amd64` and `arm64` pulls on representative student machines and port-conflict fallback (`5001:5000`) (BLOCKED: needs published Hub image from 4.2 + physical Mac/PC devices; fallback documented in setup/troubleshooting)
- [x] 5.5 Verify clean stop behavior and no host Python/MkDocs/Node required, then declare `1.0` ready
