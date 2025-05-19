# Zed on Windows

Zed now has experimental Windows builds. They can be installed using our PowerShell script.

## Installing

Run the following command from a PowerShell prompt:

```powershell
irm https://zed.dev/install.ps1 | iex
```

Set the `ZED_CHANNEL` environment variable to `preview` to install preview builds:

```powershell
$env:ZED_CHANNEL = 'preview'
irm https://zed.dev/install.ps1 | iex
```

The script downloads the latest bundle, extracts it to `%LOCALAPPDATA%\Programs\Zed`, creates a Start Menu shortcut, and registers the `.zed` file association.

## Uninstalling

To remove Zed installed by the script, run:

```powershell
irm https://zed.dev/uninstall.ps1 | iex
```

Alternatively, you can run `script/uninstall.ps1` from a cloned repository.

## Building from source

If you wish to build Zed yourself or contribute to Windows support, see [Building for Windows](./development/windows.md).

We are currently hiring a [Windows Lead](https://zed.dev/jobs/windows-lead) and welcome contributions from the community. Join the discussion in the [Windows issues list](https://github.com/zed-industries/zed/issues?q=is%3Aissue+is%3Aopen+label%3Awindows) or on our [Zed Community Discord](https://zed.dev/community-links) in the `#windows` channel.
