# Changelog

All notable changes to **SEISwift** are documented here.

This project follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added

- `Label(_:icon:)` convenience initializer, mirroring SwiftUI's own `Label(_:systemImage:)`.
- CI (`ci.yml`) and tag-triggered release (`release.yml`).

### Changed

- Moved architecture docs to `docs/ARCHITECTURE.md`, trimmed to essentials (dropped roadmap/comparison sections).

---

## [2.0.0] — 2026-08-20

### Added

- `SEIIconsFilled` enum and `SEIIcon.filled(_:renderingMode:)`, exposing the 23 icons that have filled artwork with a compile-time-safe API — mirrors `SeiIconsFilled`/`SeiIcon.filled` in `flutter_sei`/`dart_sei`.
- `UIImage.sei(filled:)` and `NSImage.sei(filled:)` for the same filled-icon set.
- `NSImage.sei(_:)` extension, giving macOS (AppKit) the same imperative icon-loading API UIKit already had via `UIImage.sei(_:)`.
- visionOS 1.0+ support.
- Test coverage for `NSImage.sei(_:)`, `SEIIconsFilled`, and both `filled:` loaders.
- `Justfile` task runner (`install`/`build`/`test`/`typecheck`/`lint`/`format`/`check`/`clean`), `.swiftlint.yml`, `.swift-format`, and `CLAUDE.md` documenting tooling choices and deliberate exceptions.
- Full OSS bundle: `SECURITY.md`, `SUPPORT.md`, `.github/PULL_REQUEST_TEMPLATE.md`, `.github/ISSUE_TEMPLATE/`, `.github/CODEOWNERS`.

### Changed

- Renamed the icon enum `SEIIcon` → `SEIIcons`, mirroring the `Icon`/`Icons` naming convention shared with the Flutter and Dart SEI packages.
- Raised minimum platform versions: iOS 15.0+, macOS 12.0+, tvOS 15.0+, watchOS 8.0+ (previously iOS 13.0+, macOS 10.15+, tvOS 13.0+, watchOS 6.0+).
- `swift-tools-version` raised to 6.0; package now builds under Swift 6 language mode with strict concurrency (`swiftLanguageMode(.v6)`).
- Modernized SwiftUI usage in previews and examples: `.foregroundColor` → `.foregroundStyle`, `NavigationView` → `NavigationStack`.
- Removed redundant `@available` annotations made obsolete by the raised platform floors.
- Relicensed from a proprietary "all rights reserved" license to MIT, matching `flutter_sei`/`dart_sei`.

### Fixed

- Icon artwork is now bundled as PDF vector assets inside the asset catalog instead of raw SVG, which Xcode's Asset Catalog format does not support for imagesets. Previously, `UIImage(named:in:compatibleWith:)`/`Image(_:bundle:)` could not resolve icons at all when the package was built and tested through Xcode (`xcodebuild`), since the `.xcassets` folder never compiled into `Assets.car`.
- Resource-loading tests now skip themselves under plain `swift test` (via `XCTSkipUnless`, detecting whether `Assets.car` exists) instead of failing on the SwiftPM/`actool` gap described above — `xcodebuild test` remains the authoritative check for anything resource-related.

### Deprecated

- `SxEloIcon` is now `@available(*, deprecated, renamed: "SEIIcon")` — a typealias for the renamed `SEIIcon` view, kept for a smoother migration. See "Migrating from 1.x" in README.md.

---

## [1.0.0] — 2026-01-30

### Added

- Initial release of SEISwift
- Complete icon catalog with 120 professionally designed icons
- Type-safe `SEIIcon` enum with `CaseIterable` and `Sendable` conformance
- SwiftUI support via `SxEloIcon` view component
- UIKit support via `UIImage.sei(_:)` extension
- Full styling support (colors, sizes, rendering modes)
- Platform support: iOS 13+, macOS 10.15+, tvOS 13+, watchOS 6+
- Swift Package Manager integration
- Comprehensive test suite validating all icons
- Complete API documentation with Swift-DocC style

---

[Unreleased]: https://github.com/sxnnyside-project/sei-swift/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/sxnnyside-project/sei-swift/releases/tag/v2.0.0
[1.0.0]: https://github.com/sxnnyside-project/sei-swift/releases/tag/v1.0.0
