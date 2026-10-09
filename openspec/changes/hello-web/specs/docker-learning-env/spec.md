## ADDED Requirements

### Requirement: Ready-to-use container on port 5000
The Docker image SHALL serve the complete prebuilt tutorial site and runnable examples on `0.0.0.0:5000` inside the container in the foreground, so `docker run --rm -p 5000:5000 <image>` makes the homepage reachable at `http://localhost:5000` with no host-installed Python, MkDocs, or Node and no mandatory accounts or external services.

#### Scenario: Cold start serves homepage
- **WHEN** a student runs the documented `docker run --rm -p 5000:5000` command on a Docker-capable machine
- **THEN** the tutorial homepage loads at `http://localhost:5000` and container logs show useful startup diagnostics

#### Scenario: Clean stop
- **WHEN** the container is stopped
- **THEN** it shuts down cleanly without requiring privileged flags, socket access, or host filesystem writes

### Requirement: Predictable docs and examples URL contract
The served site SHALL expose the homepage at `/` and runnable examples at predictable paths (`/examples/html/`, `/examples/css/`, `/examples/javascript/`, `/examples/mini-games/`) backed by real files and explicit index pages, with per-lesson Run Example and View Source links; early examples SHALL be self-contained without backends or build steps.

#### Scenario: Examples run in browser
- **WHEN** a student opens an example URL from a lesson Run link
- **THEN** the intended HTML file renders with its CSS and JavaScript loading correctly and interactive behavior working in a normal browser

#### Scenario: No assumed directory listings
- **WHEN** a student opens an `/examples/<area>/` path
- **THEN** an explicit index page lists the available exercises rather than relying on server-generated listings

### Requirement: Minimal secure reproducible runtime
The runtime image SHALL use a lightweight maintained static server, multi-stage build (MkDocs build copied into runtime, no Python/MkDocs required at runtime), pinned dependencies, exposed port 5000 only, non-root user when practical, no embedded secrets, and only files needed to serve the learning environment.

#### Scenario: No host toolchain required
- **WHEN** the site is served from the container on a machine without Python or MkDocs installed
- **THEN** all Parts, Chapters, internal links, and assets resolve correctly

### Requirement: Docker acceptance checklist
The change SHALL be accepted only after verifying image builds from the documented repo, starts via the documented run command, homepage and all Parts/Chapters resolve, example URLs return intended files with working assets and interactions, internal links work, no host MkDocs/Python is needed, and the container stops cleanly.

#### Scenario: Verification before ready claim
- **WHEN** maintainers run the acceptance checklist on a clean machine
- **THEN** all ten checks (build, start, homepage, nav, example URLs, assets, interactions, internal links, no host toolchain, clean stop) pass before the container is declared ready
