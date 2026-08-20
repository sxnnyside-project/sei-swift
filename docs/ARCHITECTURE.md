# Architecture

```
sei-swift/
├── Sources/SEISwift/
│   ├── SEIIcons.swift           # icon enum, CaseIterable, Sendable
│   ├── SEIIconsFilled.swift     # filled-icon subset enum
│   ├── SEIIcon.swift            # SwiftUI View (outline + .filled(_:) factory)
│   ├── Label+SEI.swift          # Label(_:icon:) convenience, mirrors Label(_:systemImage:)
│   ├── UIImage+SEI.swift        # UIKit extension
│   ├── NSImage+SEI.swift        # AppKit extension
│   ├── Resources/SEI.xcassets/  # asset catalog, one imageset per icon
│   └── SEISwift.docc/           # DocC catalog
├── Tests/SEISwiftTests/
└── docs/                        # this file
```

## Resources

Icons ship as vector PDF inside `.xcassets` imagesets, resolved through
`Bundle.module` (never `Bundle.main`). Asset Catalogs don't support raw SVG
for imagesets — source art is authored as SVG and converted with
`rsvg-convert -f pdf` before being placed in `SEI.xcassets`. Filled variants
use the `{name}-filled.imageset` naming convention to avoid colliding with
the outline imageset of the same icon.

Asset Catalogs only compile to `Assets.car` under Xcode's build system —
`swift build`/`swift test` copy `.xcassets` uncompiled. See
[CLAUDE.md](../CLAUDE.md) for how the test suite handles this.

## Public API

| Symbol | Purpose |
| --- | --- |
| `SEIIcons` | every icon, outline |
| `SEIIconsFilled` | icons that also have filled artwork |
| `SEIIcon` | SwiftUI view; `.filled(_:)` for filled variants |
| `Label(_:icon:)` | SwiftUI `Label` convenience |
| `UIImage.sei(_:)` / `.sei(filled:)` | UIKit |
| `NSImage.sei(_:)` / `.sei(filled:)` | AppKit |

`SEIIconsFilled` is a separate enum from `SEIIcons`, not a property on it —
requesting a filled icon that doesn't exist is a compile-time error, not a
runtime one.
