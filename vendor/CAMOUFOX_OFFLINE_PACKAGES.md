# Camoufox Offline Packages

Camoufox browser zip packages are intentionally not committed to this repository.
The packages are larger than GitHub's normal 100 MB file limit, so each machine
should download the matching package and place it in the path below.

## Version

- Camoufox: `152.0.4-beta.30`

## Windows x64

Expected local path:

```text
vendor/camoufox-windows/camoufox-152.0.4-beta.30-win.x86_64.zip
```

Download URLs:

- Official: https://github.com/daijro/camoufox/releases/download/v152.0.4-beta.30/camoufox-152.0.4-beta.30-win.x86_64.zip
- Mirror: https://sourceforge.net/projects/camofox-browser.mirror/files/camoufox-backup-380139564/camoufox-152.0.4-beta.30-win.x86_64.zip/download

SHA256:

```text
ea52a02fb1cfb1813ef6a326bea03fb2b650c9774143d953a94a27bfc8f10072
```

Install from the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\vendor\camoufox-windows\install-camoufox-windows.ps1
```

## macOS arm64

Expected local path:

```text
camoufox-152.0.4-beta.30-mac.arm64.zip
```

Download URLs:

- Official: https://github.com/daijro/camoufox/releases/download/v152.0.4-beta.30/camoufox-152.0.4-beta.30-mac.arm64.zip
- Mirror: https://sourceforge.net/projects/camofox-browser.mirror/files/camoufox-backup-380139564/camoufox-152.0.4-beta.30-mac.arm64.zip/download

SHA256:

```text
3b43e766574f286a6a63296cf58b660b7a3120952086c869b4df4c9a71604bc3
```

## Notes

- Keep these zip files local. They are ignored by `.gitignore`.
- Use the SHA256 values above to verify the package after download.
- Do not commit proxy subscriptions, account tokens, `.env`, or local proxy files.
