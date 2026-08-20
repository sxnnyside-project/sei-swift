# SEISwift

![Version](https://img.shields.io/badge/version-2.0.0-blue)
![License](https://img.shields.io/badge/License-MIT-green)
[![CI](https://github.com/sxnnyside-project/sei-swift/actions/workflows/ci.yml/badge.svg)](https://github.com/sxnnyside-project/sei-swift/actions/workflows/ci.yml)

<p align="center">
  <strong>Type-safe ✦ SwiftUI-native ✦ Zero configuration</strong><br>
  <em>Native, type-safe access to Sxnnyside Eloquent Icons for SwiftUI, UIKit, and AppKit.</em>
</p>

<p align="center">
  <a href="#about">About</a> ✦
  <a href="#features">Features</a> ✦
  <a href="#installation">Installation</a> ✦
  <a href="#usage">Usage</a> ✦
  <a href="#architecture">Architecture</a> ✦
  <a href="#contributing">Contributing</a>
</p>

---

## About

**SEISwift** is the official Swift package for Sxnnyside Eloquent Icons (SEI), providing a type-safe enum-based API instead of string-based asset lookups.

Most icon packages either ship raw asset names as strings — no autocomplete, no compile-time safety, typos fail at runtime — or wrap icons in a heavyweight abstraction that fights SwiftUI's own composition model. SEISwift does neither: `SEIIcon` is a small `View` that composes with `.font`, `.foregroundStyle`, `Label`, `Button`, and any layout container exactly like `Image` does, because that's what it wraps.

Icons ship as vector PDF inside a native Xcode Asset Catalog, resolved through `Bundle.module` — never `Bundle.main` — so the package works correctly as a dependency, not just standalone.

### Philosophy

> *"A Swift package should feel like a native part of the Apple ecosystem, not an SVG collection superficially adapted to Swift."*

SEISwift is a Sxnnyside Project.

## Features

- **`SEIIcon` view**: a single, small SwiftUI `View` for rendering any icon, outline or filled.
- **`SEIIcons` enum**: type-safe, autocomplete-friendly icon identifiers — 120 icons.
- **Type-safe filled icons** via `SEIIcon.filled(_:)` and `SEIIconsFilled` — only icons that actually have filled artwork are accepted, so there's no runtime crash for requesting one that doesn't exist.
- **Triple platform support**: SwiftUI (`SEIIcon`), UIKit (`UIImage.sei(_:)`), and AppKit (`NSImage.sei(_:)`).
- **Modern Swift**: Swift 6 language mode, strict concurrency, `Sendable` conformance throughout.
- **Zero configuration**: `Bundle.module` resolves resources automatically — no manual setup.

## Installation

### Prerequisites

- Swift 6.0+ (Xcode 16.0+)

No other prerequisites — Swift Package Manager is bundled with the Swift toolchain.

### From Source

```bash
git clone https://github.com/sxnnyside-project/sei-swift.git
cd sei-swift

swift build
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/sxnnyside-project/sei-swift.git", from: "2.0.0")
]
```

Or via Xcode: File → Add Package Dependencies → `https://github.com/sxnnyside-project/sei-swift.git`.

## Usage

### SwiftUI

```swift
import SwiftUI
import SEISwift

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            SEIIcon(.home)

            SEIIcon(.heart)
                .foregroundStyle(.red)
                .font(.largeTitle)

            SEIIcon.filled(.heart)
                .foregroundStyle(.red)

            Label("Settings", icon: .settings)
        }
    }
}
```

### UIKit

```swift
import UIKit
import SEISwift

let imageView = UIImageView(image: .sei(.home))
imageView.tintColor = .systemBlue
```

### AppKit

```swift
import AppKit
import SEISwift

let imageView = NSImageView(image: .sei(.home) ?? NSImage())
```

For the complete icon catalog, API reference, and advanced examples (lists, toolbars, filled-icon variants), see [Sources/SEISwift/SEIIcons.swift](Sources/SEISwift/SEIIcons.swift), [Sources/SEISwift/SEIIconsFilled.swift](Sources/SEISwift/SEIIconsFilled.swift), and the DocC documentation catalog at [Sources/SEISwift/SEISwift.docc](Sources/SEISwift/SEISwift.docc).

## Migrating from 1.x

Version 2.0.0 renames the icon enum and the SwiftUI view:

| 1.x | 2.0.0+ |
| --- | --- |
| `SEIIcon` (enum) | `SEIIcons` |
| `SxEloIcon` (view) | `SEIIcon` |

`SxEloIcon` remains available as `@available(*, deprecated, renamed: "SEIIcon")`. The enum rename has no compatibility shim — `SEIIcon` is now the view's name, so the two can't coexist under one symbol.

## Architecture

```
sei-swift/
├── Sources/SEISwift/    # library target — icons, views, platform extensions
├── Tests/SEISwiftTests/ # XCTest suite
└── Examples/            # reference usage, not part of any SPM target
```

For a detailed breakdown, see [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## Development

The full command surface is exposed through a root `Justfile`, run via `just`:

```bash
just check     # full quality gate — format, lint, typecheck, test
```

See [CLAUDE.md](CLAUDE.md) for the full architecture and tooling rationale.

CI runs the same gate on every push/PR; pushing a `vX.Y.Z` tag triggers a
release build and a GitHub Release generated from `CHANGELOG.md`.

## Contributing

Contributions are accepted. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

Before contributing, read the [Code of Conduct](CODE_OF_CONDUCT.md).

## Support

See [SUPPORT.md](SUPPORT.md) for how to get help, and [SECURITY.md](SECURITY.md) to report a vulnerability.

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  <strong>SEISwift</strong> — A Sxnnyside Project<br>
  <em>&copy; 2026 Sxnnyside Project</em>
</p>
