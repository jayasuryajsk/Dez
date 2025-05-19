# Zed on Windows

You can install Zed on Windows using our PowerShell script. Run:

```powershell
irm https://zed.dev/install.ps1 | iex
```

If you'd like to test our preview channel, set the environment variable and run
the script again:

```powershell
$env:ZED_CHANNEL = "preview"
irm https://zed.dev/install.ps1 | iex
```

The installer places Zed inside `%LOCALAPPDATA%\Programs\Zed` and adds the
`zed` command to your `PATH`.

For details on building from source or packaging, see
- [Building for Windows](./development/windows.md)

We are currently hiring a [Windows Lead](https://zed.dev/jobs/windows-lead).

We welcome contributions from the community to improve Windows support.

- [GitHub Issues with 'Windows' label](https://github.com/zed-industries/zed/issues?q=is%3Aissue+is%3Aopen+label%3Awindows)
- [Zed Community Discord](https://zed.dev/community-links) -> `#windows`
