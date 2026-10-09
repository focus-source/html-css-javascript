## ADDED Requirements

### Requirement: Public image identity and tags
The course SHALL publish to public Docker Hub repository `focuslog/hello-web` with tags `1.0` (pinned, semester-stable) and `latest` (moving quick-start); student onboarding SHALL teach `latest` on page one and pin `1.0` in syllabus/lab instructions, and `1.0` SHALL remain immutable after the class freeze with fixes released as new versions.

#### Scenario: Student quick-start uses latest
- **WHEN** a student runs `docker run --rm -p 5000:5000 focuslog/hello-web:latest`
- **THEN** a working learning environment starts and serves `http://localhost:5000`

#### Scenario: Lab pins stable version
- **WHEN** an instructor specifies `focuslog/hello-web:1.0` for a semester
- **THEN** every machine pulling that tag receives the identical verified content

### Requirement: GitHub Actions publish from org-owned repo
Publishing SHALL originate from GitHub via Actions into the `focuslog` org using a scoped Hub credential stored as GitHub secrets (never baked into the image), building `linux/amd64` and `linux/arm64` manifests and pushing both tags with digests reported for verification.

#### Scenario: Push produces both architectures and tags
- **WHEN** the publish workflow completes for a release
- **THEN** both `1.0` and `latest` resolve to multi-arch manifests covering `amd64` and `arm64` with printed digests

#### Scenario: Free-account public publishing
- **WHEN** a maintainer with a free Docker Hub account and org rights runs the publish
- **THEN** pushing the public repository succeeds without requiring a paid plan

### Requirement: Registry documentation and fallbacks
The tutorial SHALL document the exact registry, repository, and tags (never an invented name), distinguish default pull-run learning mode from optional local-build and no-Docker fallbacks, and include troubleshooting for daemon-off, port-in-use (e.g. `5001:5000`), and pull-limit/NAT behaviors.

#### Scenario: Student resolves port conflict
- **WHEN** port 5000 is occupied on the host
- **THEN** the docs guide the student to run with an alternate host port and open the corresponding localhost URL
