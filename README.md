# SEISwift

**Sxnnyside Eloquent Icons** – Official Swift package for high-quality, professionally designed icons.

SEISwift provides native, type-safe access to the complete Sxnnyside Eloquent Icons catalog for both SwiftUI and UIKit applications. Built with modern Swift best practices and fully integrated with Swift Package Manager.

## Features

- ✨ **120 professionally designed icons**
- 🎯 **Type-safe API** – No string-based lookups
- 🔄 **Dual platform support** – SwiftUI and UIKit
- 📦 **Swift Package Manager** ready
- 🎨 **Full styling support** – Colors, sizes, rendering modes
- 📚 **Comprehensive documentation**
- ✅ **Production ready** with complete test coverage

## Installation

### Swift Package Manager

Add SEISwift to your project using Xcode:

1. File → Add Package Dependencies
2. Enter the repository URL: `https://github.com/sxnnyside/sei_swift`
3. Select version: `1.0.0` or later

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/sxnnyside/sei_swift", from: "1.0.0")
]
```

## Usage

### SwiftUI

Use the `SxEloIcon` view for declarative icon rendering:

```swift
import SwiftUI
import SEISwift

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Basic icon
            SxEloIcon(.home)
            
            // Styled icon
            SxEloIcon(.heart)
                .foregroundStyle(.red)
                .font(.largeTitle)
            
            // Custom rendering mode
            SxEloIcon(.lock, renderingMode: .template)
                .foregroundStyle(.blue)
                .font(.title)
        }
    }
}
```

#### Advanced SwiftUI Examples

```swift
// In a list
List {
    ForEach(items) { item in
        Label {
            Text(item.name)
        } icon: {
            SxEloIcon(.folder)
                .foregroundStyle(.blue)
        }
    }
}

// In a button
Button {
    // Action
} label: {
    HStack {
        SxEloIcon(.settings)
        Text("Settings")
    }
}
.foregroundStyle(.white)
.padding()
.background(.blue)
.cornerRadius(8)

// In a toolbar
.toolbar {
    ToolbarItem(placement: .primaryAction) {
        Button {
            // Action
        } label: {
            SxEloIcon(.add)
        }
    }
}
```

### UIKit

Use the `UIImage.sei(_:)` extension for imperative icon loading:

```swift
import UIKit
import SEISwift

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image view
        let imageView = UIImageView(image: .sei(.home))
        imageView.tintColor = .systemBlue
        
        // Button
        let button = UIButton(type: .system)
        button.setImage(.sei(.settings), for: .normal)
        
        // Tab bar item
        let tabBarItem = UITabBarItem(
            title: "Home",
            image: .sei(.home),
            selectedImage: .sei(.home)
        )
        
        // Navigation bar
        let barButtonItem = UIBarButtonItem(
            image: .sei(.add),
            style: .plain,
            target: self,
            action: #selector(addTapped)
        )
        navigationItem.rightBarButtonItem = barButtonItem
    }
}
```

## Icon Catalog

SEISwift includes 120 carefully crafted icons organized into categories:

### Categories

- **Common Actions**: add, back, check, close, edit, filter, menu, more, remove, search, share, sort
- **Navigation**: home, apps, dashboard, layoutGrid, layoutList, tab, window
- **User & Account**: account, profile, user, users, team, login, logout, register
- **Communication**: message, notification, invite
- **Security**: lock, unlock, shield, key, fingerprint, firewall, verified
- **Files & Storage**: file, folder, cloud, database, backup, restore
- **Development**: code, terminal, bug, debug, api, function, variable, brackets
- **System**: settings, power, cpu, server, router, connection, sync, update
- **Status**: success, error, warning, info, help, alert
- **Media**: music, sound, mute, gamepad, joystick
- **Analytics**: analytics, chartBar, chartLine, chartPie, progress
- **Commerce**: money, wallet, creditCard, pricing, discount, invoice
- **Productivity**: calendar, clock, timer, task, checklist, focus
- **Network**: wifi, offline, globe, browser, link
- **Utility**: qr, scan, visibility, star, heart, flame, badge, crown

[View complete icon list →](Sources/SEISwift/SEIIcon.swift)

## API Reference

### `SEIIcon`

A type-safe enumeration of all available icons.

```swift
public enum SEIIcon: String, CaseIterable, Sendable {
    case home
    case settings
    case lock
    // ... 117 more cases
}
```

### `SxEloIcon`

SwiftUI view for rendering icons with full styling support.

```swift
public struct SxEloIcon: View {
    public init(
        _ icon: SEIIcon,
        renderingMode: Image.TemplateRenderingMode? = .template
    )
}
```

### `UIImage.sei(_:)`

UIKit extension for loading icons as UIImage.

```swift
extension UIImage {
    public static func sei(_ icon: SEIIcon) -> UIImage?
}
```

## Requirements

- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+
- Swift 5.9+
- Xcode 15.0+

## Philosophy

SEISwift follows Apple's design principles:

- **Type Safety**: Compile-time guarantees with enum-based API
- **Clarity**: Intuitive naming and clear documentation
- **Consistency**: Unified experience across SwiftUI and UIKit
- **Performance**: Optimized asset loading with Bundle.module
- **Reliability**: Comprehensive test coverage

## License

Sxnnyside Project – Proprietary License

All rights reserved. This software and its icons are proprietary to the Sxnnyside Project.

## Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details on:
- How to propose new icons
- Icon design and naming conventions
- Code standards and testing
- Pull request process

Please also read our [Code of Conduct](CODE_OF_CONDUCT.md) before contributing.

## Support

- Documentation: [docs.sxnnyside.com](https://docs.sxnnyside.com)
- Issues: [GitHub Issues](https://github.com/sxnnyside/sei_swift/issues)
- Email: support@sxnnyside.com

---

**Made with ❤️ by the Sxnnyside Team**
