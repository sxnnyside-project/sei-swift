# Changelog

All notable changes to SEISwift will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-01-30

### Added

- Initial release of SEISwift
- Complete icon catalog with 124 professionally designed icons
- Type-safe `SEIIcon` enum with `CaseIterable` and `Sendable` conformance
- SwiftUI support via `SxEloIcon` view component
- UIKit support via `UIImage.sei(_:)` extension
- Full styling support (colors, sizes, rendering modes)
- Platform support: iOS 13+, macOS 10.15+, tvOS 13+, watchOS 6+
- Swift Package Manager integration
- Comprehensive test suite validating all icons
- Complete API documentation with Swift-DocC style
- Icon categories:
  - Common Actions (16 icons)
  - Navigation & Layout (7 icons)
  - User & Account (8 icons)
  - Communication (3 icons)
  - Security & Privacy (8 icons)
  - Files & Storage (6 icons)
  - Development (10 icons)
  - System & Settings (12 icons)
  - Status & Alerts (6 icons)
  - Media & Content (5 icons)
  - Analytics & Charts (5 icons)
  - Commerce & Finance (9 icons)
  - Productivity (6 icons)
  - Network & Connectivity (7 icons)
  - Utility (13 icons)
  - Build & Deploy (3 icons)

### Features

- **Type Safety**: Eliminates string-based icon lookups
- **Dual Platform**: Native support for both SwiftUI and UIKit
- **Performance**: Optimized asset loading using Bundle.module
- **Reliability**: 100% test coverage for icon catalog
- **Documentation**: Inline documentation and usage examples
- **Modern Swift**: Built with Swift 5.9+ and latest best practices

[1.0.0]: https://github.com/sxnnyside/sei_swift/releases/tag/1.0.0
