# Spinline SDK changelog

All five packages (`spinline-embed`, `spinline-embed-react-native`, `spinline_embed`, `app.spinline:embed`, `SpinlineEmbed`) share one version, kept in `sdk/VERSION`.

## 1.0.0

- First published release. Web `mount()`, React `<SpinlineGame>`, React Native `<SpinlineGame>`, Flutter `SpinlineGame`, Android `SpinlineGameView`, iOS `SpinlineGameView` + SwiftUI `SpinlineGame`.
- Every package relays the game's `ready`, `result`, `close`, `error` and `resize` events and keeps the launch URL's origin as the only trusted sender.
- Web and native frames allow the microphone so partners with voice switched on need no extra wiring beyond the OS permission.
