# Mission 1 — Your First Webpage

**Learn:** HTML document structure (doctype, head, body, tags).
**Why:** everything later builds on "write file → open → see result".
**Create:** `hello.html` with a heading, paragraph, and link.
**Needs:** browser (container file browser or local file).

## Demo (complete, runnable)

Save as `hello.html` and open it — double-click locally, or via the
container at [/examples/html/hello-web.html](/examples/html/hello-web.html):

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Hello Web</title>
</head>
<body>
  <h1>Hello, web!</h1>
  <p>I built this page myself.</p>
  <a href="https://example.com">A link I trust</a>
</body>
</html>
```

- [Run Example](/examples/html/hello-web.html) — open it live.
- [View Source](/examples/html/hello-web.html) — same file; right-click → View Source in the browser.

**What success looks like:** a big heading, one paragraph, one clickable link.

## Walkthrough

- `<!DOCTYPE html>` tells the browser this is modern HTML.
- `<html lang="en">` wraps everything; `<head>` holds metadata, `<body>` holds visible content.
- `<h1>` is the top heading; `<p>` is a paragraph; `<a href="...">` is a link.
- `<meta charset>` and `<viewport>` keep text and mobile rendering correct.

## Predict before you run

Before opening: which text will be biggest? What happens if you change the
`href` to another URL you trust?

## Try next (modify one thing at a time)

1. Change the heading text, refresh — see it update instantly.
2. Add a second paragraph under the first, refresh.

!!! warning "Common mistakes"
    Saved as `hello.html.txt` (Windows hides extensions — rename to end exactly `.html`).
    Edited one copy but opened another in Downloads — check the address bar.
    Forgot to refresh after saving — the browser shows the old file until you reload.
