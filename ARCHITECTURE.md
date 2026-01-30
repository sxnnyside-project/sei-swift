# SEISwift – Architecture

## Overview

SEISwift is a modern, minimalist Swift Package designed to provide native, type-safe access to Sxnnyside Eloquent Icons in Swift applications.

## Design Principles

### 1. Type Safety First
- `SEIIcon` enum eliminates magic strings
- `CaseIterable` enables enumeration of all icons
- `Sendable` ensures concurrency safety

### 2. Clean and Expressive API
- SwiftUI: `SxEloIcon(.home)` – Declarative and natural
- UIKit: `UIImage.sei(.home)` – Consistent with Apple APIs
- No verbose prefixes, no unnecessary namespaces

### 3. Zero Configuration
- `Bundle.module` manages resources automatically
- No manual initialization required
- Swift Package Manager does all the work

### 4. Platform Agnostic
- Same enum for SwiftUI and UIKit
- Compatible with iOS, macOS, tvOS, watchOS
- No external dependencies

## File Structure

```
SEISwift/
├── Package.swift                    # SPM configuration
├── LICENSE                          # Proprietary license
├── README.md                        # Main documentation
├── CHANGELOG.md                     # Version history
├── CODE_OF_CONDUCT.md              # Community guidelines
├── CONTRIBUTING.md                  # Contribution guidelines
├── ARCHITECTURE.md                  # This file
│
├── Sources/
│   └── SEISwift/
│       ├── SEIIcon.swift            # Central icon enum
│       ├── SxEloIcon.swift          # SwiftUI View
│       ├── UIImage+SEI.swift        # UIKit extension
│       ├── Resources/
│       │   └── SEI.xcassets/        # Asset catalog
│       │       ├── Contents.json
│       │       ├── home.imageset/
│       │       ├── settings.imageset/
│       │       └── ... (120 imagesets)
│       └── SEISwift.docc/
│           └── SEISwift.md          # DocC documentation
│
└── Tests/
    └── SEISwiftTests/
        └── SEISwiftTests.swift      # Complete test suite
```

## Core Components

### 1. SEIIcon (Enum)

**Purpose**: Type-safe catalog of all available icons.

**Features**:
- `String` raw value = asset name
- `CaseIterable` for iteration
- `Sendable` for Swift Concurrency
- Organized in categories with MARK comments

**Design**:
```swift
public enum SEIIcon: String, CaseIterable, Sendable {
    case home
    case settings
    // ...
    
    public var assetName: String { rawValue }
}
```

### 2. SxEloIcon (SwiftUI View)

**Purpose**: Declarative component for rendering icons in SwiftUI.

**Features**:
- Wrapper around `Image(_, bundle: .module)`
- Support for `renderingMode`
- Compatible with native SwiftUI modifiers
- Previews included for development

**Philosophy**:
- Not an `ImageView` with 100 properties
- Simple `View` that composes with modifiers
- Follows SwiftUI pattern: small, composable, extensible

### 3. UIImage+SEI (UIKit Extension)

**Purpose**: Imperative API for loading icons in UIKit.

**Features**:
- Static method `UIImage.sei(_:)`
- Uses `UIImage(named:in:compatibleWith:)`
- Returns `UIImage?` (explicit error handling)
- Conditionally compiled with `#if canImport(UIKit)`

**Philosophy**:
- Extension of `UIImage`, not custom wrapper
- Natural integration with existing UIKit
- Compatible with `UIImageView`, `UIButton`, etc.

## Resource Management

### Asset Catalog Structure

Icons are organized in an Apple-compliant `.xcassets` structure:

```
SEI.xcassets/
├── Contents.json
├── home.imageset/
│   ├── Contents.json
│   └── home.svg
├── settings.imageset/
│   ├── Contents.json
│   └── settings.svg
└── ... (120 imagesets)
```

Each imageset:
- Contains one SVG file
- Preserves vector representation
- Uses template rendering intent for tinting
- Scales automatically for all device sizes

### Bundle.module

Swift Package Manager automatically provides `Bundle.module` for accessing package resources.

**Advantages**:
- No manual configuration required
- Resource isolation per module
- Compatible with framework and local development

**Implementation**:
```swift
// SwiftUI
Image(icon.assetName, bundle: .module)

// UIKit
UIImage(named: icon.assetName, in: .module, compatibleWith: nil)
```

### SVG Assets

Icons are distributed as SVG for:
- Scalability without quality loss
- Reduced package size
- Native support in iOS 13+
- Perfect rendering at any size
- Tintable with system colors

## Testing Strategy

### Test Coverage

1. **Catalog Validation**
   - All cases have valid raw values
   - No duplicates
   - Correct icon count

2. **Asset Loading**
   - All icons load without crash
   - UIKit: `UIImage.sei(_:)` works for all
   - Known icon validation

3. **Performance**
   - Enumeration benchmarks
   - Image loading benchmarks

### Testing Philosophy

- Fast and deterministic tests
- No external dependencies
- Exhaustive validation of API contract

## Versioning Philosophy

We follow [Semantic Versioning](https://semver.org):

- **MAJOR**: Breaking API changes
- **MINOR**: New compatible functionality
- **PATCH**: Bug fixes

Example: `1.2.3`
- `1` = API version
- `2` = New icons added
- `3` = Bug fix in resource loading

## Comparison with Alternatives

### vs. SF Symbols
- ✅ Unique visual identity
- ✅ Not limited to Apple ecosystem
- ✅ Controlled licensing

### vs. Third-Party Icon Packs
- ✅ Type-safe (no strings)
- ✅ Native integration (no web fonts)
- ✅ Native SwiftUI and UIKit

### vs. Manual Asset Catalogs
- ✅ No manual import required
- ✅ Programmatic API
- ✅ Updatable via SPM

## Future Roadmap

### 1.1.0 (Q2 2026)
- [ ] Filled/outline variants as renderingMode
- [ ] Support for custom colors per icon
- [ ] `Label` extension with SEIIcon initializer

### 1.2.0 (Q3 2026)
- [ ] Animated icons (Lottie integration)
- [ ] Icon previewer (Sample app)
- [ ] CLI for generating custom catalog

### 2.0.0 (Q4 2026)
- [ ] Refactor for Swift 6.0
- [ ] Macro-based icon generation
- [ ] Dynamic icon registry

## Code Philosophy

### Minimalism
- No over-engineering
- No external dependencies
- Small but powerful API surface

### Expressiveness
- Clear and concise names
- Self-documenting code
- Examples in documentation

### Production-Ready
- Exhaustive tests
- Complete documentation
- Strict versioning

## Contributing

SEISwift is a proprietary project by Sxnnyside Project. To contribute:

1. Report bugs via GitHub Issues
2. Propose features via Discussions
3. See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines
4. Contact legal@sxnnyside.com for collaborations

---

**Crafted with precision by Sxnnyside Project**  
*Clean API design, the Apple way.*
