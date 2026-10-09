## Why

First-year engineering students with no prior web experience need a browser-first, small-wins tutorial (HTML/CSS/JS) they can start without installing Python, MkDocs, or Node. A Docker Hub-first learning environment removes setup drift and makes Day-1 simply `docker run` → open browser → build first page.

## What Changes

- Establish `hello-web` course blueprint: audience (absolute beginners), mission-based Parts/Chapters, full-code demos → scaffolded challenges, gamified badges without servers/accounts.
- Define Docker-first learning environment: single container serves prebuilt MkDocs static site + runnable `examples/` on `0.0.0.0:5000`, Nginx runtime, read-only default, optional live-edit mode separated.
- Publish public image `focuslog/hello-web` with tags `1.0` (pinned, semester-stable) and `latest` (quick-start); publish from GitHub via Actions with multi-arch (`linux/amd64`, `linux/arm64`).
- Document student onboarding as: install Docker → `docker run --rm -p 5000:5000 focuslog/hello-web:<tag>` → open `http://localhost:5000`; keep local-build and no-Docker fallbacks as secondary paths.
- Add Docker verification checklist (clean-machine pull, homepage, nav, examples URLs, CSS/JS loads, interactive examples, clean stop) as acceptance before claiming ready.

## Capabilities

### New Capabilities

- `fresher-web-curriculum`: course structure, learning objectives, mission progression, teaching/gamification rules, exercise catalog, assessment strategy.
- `docker-learning-env`: container contract — serves docs + examples on port 5000, URL structure, static server, reliability/security, verification checklist.
- `docker-hub-publishing`: public registry contract — image `focuslog/hello-web`, tags `1.0` + `latest`, GitHub Actions publish, multi-arch, free-account public repo usage.

### Modified Capabilities

- None (no existing specs in `openspec/specs/`).

## Impact

- New docs source (`docs/`), runnable `examples/`, `Dockerfile` + `.dockerignore` (future implementation, not in this proposal).
- New GitHub Actions publishing path to Docker Hub org `focuslog`.
- Student dependency becomes Docker + browser only; maintainers own build/publish/verify.
- Lab considerations: Docker Desktop/Engine install, port 5000 conflicts, pull limits behind NAT, slow-network pull size.
