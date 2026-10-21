# Archive

Standalone migration pilot of the existing Nixe Archive application.

Build: `cargo build --release --locked -p nixe-archive`.
Install: `./install.sh` (binary, launcher, icon; does not launch the app).
Requires Rust, GTK4 >= 4.18 development files, pkg-config, and 7-Zip at runtime.
Data, application identity, command-line behavior, and UI are unchanged.
Shared dependencies currently use local immutable Git sources. Publishing is gated.
The retained archive-v0.1.0 tag records historical source, not this new packaging.
