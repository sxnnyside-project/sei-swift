// Created by Sxnnyside Project on 30/01/26.

import SwiftUI

/// A SwiftUI view that displays a Sxnnyside Eloquent Icon.
///
/// `SxEloIcon` provides a native SwiftUI interface for rendering SEI icons
/// with full support for styling, sizing, and rendering modes.
///
/// ## Example
///
/// ```swift
/// SxEloIcon(.home)
///     .foregroundStyle(.blue)
///     .font(.title)
///
/// SxEloIcon(.lock, renderingMode: .template)
///     .foregroundStyle(.red)
/// ```
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SxEloIcon: View {
    private let icon: SEIIcon
    private let renderingMode: Image.TemplateRenderingMode?
    
    /// Creates an icon view with the specified icon.
    ///
    /// - Parameters:
    ///   - icon: The icon to display.
    ///   - renderingMode: The rendering mode for the icon image. Defaults to `.template`.
    public init(
        _ icon: SEIIcon,
        renderingMode: Image.TemplateRenderingMode? = .template
    ) {
        self.icon = icon
        self.renderingMode = renderingMode
    }
    
    public var body: some View {
        if let renderingMode {
            Image(icon.assetName, bundle: .module)
                .renderingMode(renderingMode)
        } else {
            Image(icon.assetName, bundle: .module)
        }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
#Preview("SxEloIcon Examples") {
    VStack(spacing: 20) {
        HStack(spacing: 16) {
            SxEloIcon(.home)
                .font(.largeTitle)
            
            SxEloIcon(.settings)
                .font(.title)
                .foregroundColor(.blue)
            
            SxEloIcon(.heart)
                .font(.title)
                .foregroundColor(.red)
        }
        
        HStack(spacing: 16) {
            SxEloIcon(.lock)
                .foregroundColor(.green)
            
            SxEloIcon(.star)
                .foregroundColor(.yellow)
            
            SxEloIcon(.notification)
                .foregroundColor(.purple)
        }
        
        HStack(spacing: 16) {
            SxEloIcon(.success, renderingMode: .original)
            
            SxEloIcon(.error, renderingMode: .original)
            
            SxEloIcon(.warning, renderingMode: .original)
        }
    }
    .padding()
}
