# Version Policy (1.0 + latest)

## The two tags

- `focuslog/hello-web:latest` — homepage quick-start. Moves with each release.
- `focuslog/hello-web:1.0` — semester pin used in labs and handouts.

## Rules

1. After the class freeze date, `1.0` is **never re-pushed in place**.
2. Fixes and new lessons ship as `1.1`, `1.2`, … and `latest` rolls forward.
3. The syllabus names one pinned tag; students type `latest` only on page one.
4. Every release prints its manifest digests in the Actions log — record the
   digest alongside the tag in the lab handout.

## Owner setup (one time, requires `focuslog` org rights)

1. Create a scoped Docker Hub Personal Access Token (write on this repo only).
2. In the GitHub repo add secrets:
   - `DOCKERHUB_USERNAME` — Hub username allowed to push to `focuslog`.
   - `DOCKERHUB_TOKEN` — the PAT value (never commit it, never bake into the image).
3. Push a tag `v1.0` (or Run workflow manually) — the workflow builds
   `linux/amd64` + `linux/arm64` and pushes `:1.0` + `:latest`.
4. Verify on a clean machine:
   `docker run --rm -p 5000:5000 focuslog/hello-web:1.0` → `http://localhost:5000`.

Free Docker Hub accounts support unlimited public repositories, which covers
this image. Pulls are subject to Hub's anonymous/authenticated rate limits —
labs should pull once per machine and reuse the cached image.
