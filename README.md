# TenderWriter

Welcome to TenderWriter, a high-performance, collaborative tender-writing application from the creators of [Atom](https://github.com/atom/atom) and [Tree-sitter](https://github.com/tree-sitter/tree-sitter).

---

### Installation

On macOS and Linux you can download TenderWriter directly or install it via your local package manager.

Other platforms are not yet available:

- Windows ([tracking issue](https://github.com/zed-industries/zed/issues/5394))
- Web ([tracking issue](https://github.com/zed-industries/zed/issues/5396))

### Developing TenderWriter

- [Building TenderWriter for macOS](./docs/src/development/macos.md)
- [Building TenderWriter for Linux](./docs/src/development/linux.md)
- [Building TenderWriter for Windows](./docs/src/development/windows.md)
- [Running Collaboration Locally](./docs/src/development/local-collaboration.md)

### Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for ways you can contribute to TenderWriter.

Also... we're hiring! Check out our jobs page for open roles.

### Licensing

License information for third party dependencies must be correctly provided for CI to pass.

We use [`cargo-about`](https://github.com/EmbarkStudios/cargo-about) to automatically comply with open source licenses. If CI is failing, check the following:

- Is it showing a `no license specified` error for a crate you've created? If so, add `publish = false` under `[package]` in your crate's Cargo.toml.
 - Is the error `failed to satisfy license requirements` for a dependency? If so, first determine what license the project has and whether this system is sufficient to comply with this license's requirements. If you're unsure, ask a lawyer. Once you've verified that this system is acceptable add the license's SPDX identifier to the `accepted` array in `script/licenses/tenderwriter-licenses.toml`.
 - Is `cargo-about` unable to find the license for a dependency? If so, add a clarification field at the end of `script/licenses/tenderwriter-licenses.toml`, as specified in the [cargo-about book](https://embarkstudios.github.io/cargo-about/cli/generate/config.html#crate-configuration).
