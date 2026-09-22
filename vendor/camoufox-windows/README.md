# Camoufox Windows Offline Package

This folder contains the Windows x64 Camoufox browser package used by `deploy/cf_solver`.

## Files

- `camoufox-152.0.4-beta.30-win.x86_64.zip`
- `install-camoufox-windows.ps1`

## Verify

Expected SHA256:

```text
ea52a02fb1cfb1813ef6a326bea03fb2b650c9774143d953a94a27bfc8f10072
```

PowerShell:

```powershell
Get-FileHash .\vendor\camoufox-windows\camoufox-152.0.4-beta.30-win.x86_64.zip -Algorithm SHA256
```

## Install On Windows

From the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\vendor\camoufox-windows\install-camoufox-windows.ps1
```

If you need to overwrite an existing install:

```powershell
powershell -ExecutionPolicy Bypass -File .\vendor\camoufox-windows\install-camoufox-windows.ps1 -Replace
```

The script extracts Camoufox into:

```text
%LOCALAPPDATA%\camoufox\browsers\official\152.0.4-beta.30-ea52a02f
```

and writes:

```text
%LOCALAPPDATA%\camoufox\config.json
```

so `python -m camoufox path` and `deploy\cf_solver\boterdrop_wrapper.py` can find it.

## Start cf_solver

After Python dependencies are installed:

```powershell
.\.venv-cfsolver\Scripts\python -m camoufox path
.\.venv-cfsolver\Scripts\python deploy\cf_solver\boterdrop_wrapper.py
```
