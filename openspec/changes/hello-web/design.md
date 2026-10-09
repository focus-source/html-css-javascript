## Context

Empty repo (`openspec/` scaffold only, no specs, no docs). Audience is first-year engineering freshers with zero web/programming background. Stakeholders: students (Docker + browser only), instructors/lab admins (need pinned, reproducible env), maintainers (own `focuslog` Docker Hub org, publish from GitHub). Constraint from exploration: `docker run --rm -p 5000:5000 focuslog/hello-web` must yield a ready learning environment, not just docs build. Hub repo `focuslog/hello-web` is registered but has no pushed tags yet (Hub lookup 404 = empty, not wrong name).

## Goals / Non-Goals

**Goals:**

- Day-1 onboarding is pull-and-run: install Docker → run public image → open `http://localhost:5000`.
- One container serves both prebuilt MkDocs site and runnable `examples/` with predictable URLs and explicit index pages.
- Small, fast pulls on hostel/lab networks; works on `amd64` + `arm64` student laptops.
- Semester-stable pin (`1.0`) alongside moving quick-start (`latest`); reproducible verification before claiming ready.

**Non-Goals:**

- No live-edit/rebuild in default container; editing is a separate optional mode.
- No backend, accounts, databases, or external services for core learning.
- No Dockerfile/CI implementation in this design phase — contracts and decisions only.

## Decisions

**1. Nginx static runtime over `mkdocs serve` (chosen).**
Build stage (Python + MkDocs + Material) produces `site/`; runtime stage copies `site/` + `examples/` into minimal Nginx and serves `0.0.0.0:5000` in foreground. Rationale: small (~tens of MB), no Python at runtime, stable read-only server, straightforward `docker run`. Alternative `mkdocs serve` / `python http.server` rejected: larger, dev-server fragility, live-reload not needed for default mode.

**2. Multi-stage build with clear separation.**
`docs/` (Markdown source) + `examples/` (independent runnable HTML/CSS/JS) + `Dockerfile`/`.dockerignore` at root. Build-time bridge copies `examples/` into static root so `/examples/html|css|javascript|mini-games/` resolve as real files. No assumption of auto directory listings — each folder gets an explicit index page plus per-lesson Run/Source links.

**3. Tags `1.0` + `latest`, immutable-semester policy.**
Homepage teaches `latest` for simplicity; syllabus/labs pin `1.0`. After Week-1 freeze, `1.0` is never re-pushed in place; fixes cut `1.1` and roll `latest` forward. Rationale: avoids half-lab on stale cached `1.0`. Alternative single-`latest`-only rejected (non-reproducible classroom).

**4. GitHub → Docker Hub publish, org-owned.**
Source of truth in GitHub; Actions publishes to `focuslog` org using a scoped Hub PAT stored as GitHub secrets (never baked into image). `buildx` produces `linux/amd64 + linux/arm64` manifest and pushes both tags with digest printed for verification. Rationale: matches owner control, free-account unlimited public repos covers this, multi-arch required for M-series Macs + lab PCs.

**5. Read-only default, editable optional and separate.**
Default needs no volumes, no host tools, no privileged flags. Live-edit (bind-mount or dev compose profile) is documented separately and never mandatory for Mission 1. Rationale: preserves first-day simplicity while allowing later experimentation.

**6. Port and lifecycle contract.**
Expose and serve `5000`, listen on `0.0.0.0`, foreground process, handle SIGTERM cleanly, non-root runtime when practical, no secrets in layers. Document `5001:5000` fallback (macOS AirPlay often owns 5000) and daemon-off / pull-failure troubleshooting.

## Risks / Trade-offs

- [Risk] Docker Desktop heavy (~500MB+, admin/VT-x) and blocked on some lab machines → Mitigation: keep no-Docker fallback (open `examples/*.html` directly); lab pre-pull option.
- [Risk] Anonymous pull limits (100/6h/IP) behind lab NAT → Mitigation: small image, pinned tag cached, pull-once guidance.
- [Risk] Slow hostel WiFi makes first pull painful → Mitigation: minimal runtime, no Python/MkDocs in final layer.
- [Risk] `latest` vs `1.0` cache divergence mid-semester → Mitigation: immutable `1.0` after freeze, new version per fix.
- [Risk] Hub repo currently tag-less (404 on web UI) → Mitigation: no claim of pull-ready until first verified push + clean-machine pull check.
- [Risk] Static server has no auto-index → Mitigation: explicit index pages and Run/Source link contract in specs.

## Migration Plan

No migration (greenfield). Rollout: merge docs skeleton → first verified `1.0` push → clean-machine `docker run` acceptance → announce `latest` for students, `1.0` for labs. Rollback: re-pin class to previous verified tag; Hub keeps prior tags.

## Open Questions

- Exact Hub README copy and homepage onboarding wording (short, OS-independent)?
- `1.0` freeze date and `1.1` cadence owner?
- Lab pre-pull/mirror needed for offline or bandwidth-thin labs?
- Optional editable mode shape: bind-mount path vs dev compose profile?
