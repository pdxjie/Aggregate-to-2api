# Camoufox 离线包说明

Camoufox 浏览器 zip 包不会提交到这个仓库。
原因是这些文件太大，超过 GitHub 普通仓库单文件 100 MB 的限制。
所以仓库里只保存下载地址、校验值和放置路径，zip 文件需要在每台机器本地下载后放到指定目录。

## 版本

- Camoufox: `152.0.4-beta.30`

## Windows x64

请把 Windows 版 zip 放到下面这个路径：

```text
vendor/camoufox-windows/camoufox-152.0.4-beta.30-win.x86_64.zip
```

下载地址：

- 官方地址：https://github.com/daijro/camoufox/releases/download/v152.0.4-beta.30/camoufox-152.0.4-beta.30-win.x86_64.zip
- 备用镜像：https://sourceforge.net/projects/camofox-browser.mirror/files/camoufox-backup-380139564/camoufox-152.0.4-beta.30-win.x86_64.zip/download

SHA256 校验值：

```text
ea52a02fb1cfb1813ef6a326bea03fb2b650c9774143d953a94a27bfc8f10072
```

在 Windows 的 PowerShell 中可以这样校验：

```powershell
Get-FileHash .\vendor\camoufox-windows\camoufox-152.0.4-beta.30-win.x86_64.zip -Algorithm SHA256
```

校验通过后，在项目根目录执行安装：

```powershell
powershell -ExecutionPolicy Bypass -File .\vendor\camoufox-windows\install-camoufox-windows.ps1
```

如果需要覆盖已有安装，可以加 `-Replace`：

```powershell
powershell -ExecutionPolicy Bypass -File .\vendor\camoufox-windows\install-camoufox-windows.ps1 -Replace
```

安装脚本会把 Camoufox 解压到：

```text
%LOCALAPPDATA%\camoufox\browsers\official\152.0.4-beta.30-ea52a02f
```

并写入：

```text
%LOCALAPPDATA%\camoufox\config.json
```

这样 `python -m camoufox path` 和 `deploy\cf_solver\boterdrop_wrapper.py` 就能找到浏览器。

## macOS arm64

请把 macOS arm64 版 zip 放到项目根目录：

```text
camoufox-152.0.4-beta.30-mac.arm64.zip
```

下载地址：

- 官方地址：https://github.com/daijro/camoufox/releases/download/v152.0.4-beta.30/camoufox-152.0.4-beta.30-mac.arm64.zip
- 备用镜像：https://sourceforge.net/projects/camofox-browser.mirror/files/camoufox-backup-380139564/camoufox-152.0.4-beta.30-mac.arm64.zip/download

SHA256 校验值：

```text
3b43e766574f286a6a63296cf58b660b7a3120952086c869b4df4c9a71604bc3
```

macOS 可以这样校验：

```bash
shasum -a 256 camoufox-152.0.4-beta.30-mac.arm64.zip
```

## 注意事项

- `camoufox-*.zip` 已经被 `.gitignore` 忽略，不会进入 Git 仓库。
- 下载后建议先校验 SHA256，确认文件完整。
- 不要把代理订阅、账号 token、`.env`、本地代理文件提交到仓库。
