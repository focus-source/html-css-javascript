# Troubleshooting

## Docker daemon not running

Symptom: `Cannot connect to the Docker daemon` / `docker: error`.

- Start Docker Desktop and wait for "Engine running".
- Run `docker info` — it should print server details, not an error.
- On Linux, your user may need the `docker` group or `sudo`.

## Port 5000 already in use

Symptom: `Bind for 0.0.0.0:5000 failed: port is already allocated`
(macOS AirPlay commonly owns 5000).

```bash
docker run --rm -p 5001:5000 focuslog/hello-web:latest
```

Then open **http://localhost:5001**.

## Image pull slow or rate-limited

Symptom: pull stalls or `toomanyrequests` / rate-limit headers.

- Pull once and reuse: `docker pull focuslog/hello-web:1.0`, then `docker run`.
- Prefer the pinned `:1.0` tag in labs so Docker caches one digest.
- Behind lab NAT many students share one IP budget — stagger first pulls or ask the lab to pre-pull once per machine.

## Page shows old content (stale cache)

- Hard-refresh: `Ctrl+Shift+R` (Windows/Linux) or `Cmd+Shift+R` (macOS).
- Stop the container (`Ctrl+C`), re-run the same tag — do not mix `latest` and `1.0` mid-class.

## `index.html.txt` / wrong file / blank page

- File must end exactly `.html` (enable "show file extensions" in your OS).
- Open the file you saved, not an older copy in Downloads.
- Check the browser address bar: container mode uses `http://localhost:5000/...`; fallback mode uses `file:///...`.

## CSS not applying

- Is the `<link rel="stylesheet" href="...">` path correct relative to the HTML file?
- Does the selector match? Check DevTools (`F12` → Elements) and toggle the rule live.
- Hard-refresh to bypass cache.

## JavaScript silent / console errors

- Open DevTools → Console (`F12`), read the first red error + line number.
- Common: misspelled variable, `querySelector` matching nothing (`null`), script running before the element exists (move `<script>` to end of `<body>` or use `defer`).
