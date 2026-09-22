# Provider Smoke Test

Date: 2026-09-22

## Environment

- API: `http://127.0.0.1:8100`
- `cf_solver`: `http://127.0.0.1:8001`
- `IF_MOCK_UPSTREAM=0`
- `IF_FREE_PROXY=0`
- `cf_solver.proxy_support=false`
- Direct outbound IP only; no proxy rotation was available.

## Results

| Provider | Test | Result | Notes |
| --- | --- | --- | --- |
| `imagefree/default` | Gateway text-to-image | PASS | Completed in 8.1s; downloaded `1024x1024` PNG to `data/imgs/imagefree-regression.png`. |
| `aifreeforever/gpt-image-2` | Provider-level live generation | PASS | Fresh clearance + Turnstile session returned a real image URL. |
| `aifreeforever/gpt-image-2` | Gateway live generation on current direct IP | BLOCKED | The shared IP is currently challenged by Cloudflare with HTTP 403 after repeated requests. The gateway refreshes clearance and retries once; a proxy is required for reliable rotation. |
| `nanobanana/nano-banana-pro` | Gateway request | EXPECTED ERROR | `nanobanana 号池无可用账号`; account pool contains zero accounts. |
| `falai/minimax-h3-max-*` | Live generation | NOT RUN | Provider is video-only and marked `paid`; no paid/external generation was triggered. |

## Health

- `GET /v1/healthz`: `200`, `cf_solver=up`, solver status `ok`
- Latest solver window success rate: `1.0`
- `GET /v1/providers`: `imagefree`, `aifreeforever`, `nanobanana`, and `falai` registered
- `aifreeforever.com` probe reports Cloudflare shield (`403`) as expected for a plain HTTP probe

## Verification

```text
31 passed
```

Command:

```bash
./.venv-api/bin/pytest -q tests/test_aifreeforever_unit.py tests/test_providers.py
```

## Changes covered

- `deploy/cf_solver/api_server.py`: wait briefly for `aiff_dsid` after Cloudflare clearance on `aifreeforever.com`.
- `api/providers/aifreeforever.py`: isolate Turnstile solving and refresh clearance once after an upstream HTTP 403.
- `tests/test_providers.py`: make the no-proxy fallback test deterministic by mocking the solver failure instead of calling a live upstream.
