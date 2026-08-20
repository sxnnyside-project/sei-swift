// Created by Sxnnyside Project on 30/01/26.

import SwiftUI

/// Displays a Sxnnyside Eloquent Icon.
///
/// `SEIIcon` renders like any other SwiftUI `Image` — it composes with
/// `.font`, `.foregroundStyle`, `Label`, `Button`, `NavigationStack`
/// toolbars, and layout containers (`HStack`, `VStack`, `List`, `Form`)
/// without special handling.
///
/// ```swift
/// SEIIcon(.home)
///     .foregroundStyle(.blue)
///     .font(.title)
///
/// SEIIcon(.lock, renderingMode: .template)
///     .foregroundStyle(.red)
/// ```
///
/// ## Accessibility
///
/// `SEIIcon` does not set an accessibility label or hide itself from
/// VoiceOver — that's context the icon itself doesn't have. Decorative
/// icons should be marked `.accessibilityHidden(true)` by the consumer;
/// semantic or interactive icons should get a label via `Label` or
/// `.accessibilityLabel(_:)` at the call site.
public struct SEIIcon: View {
    private let assetName: String
    private let renderingMode: Image.TemplateRenderingMode?

    /// Creates an icon view.
    ///
    /// - Parameters:
    ///   - icon: The icon to display.
    ///   - renderingMode: The rendering mode for the icon image. Defaults to `.template`,
    ///     so the icon tints with the current `.foregroundStyle` by default.
    public init(
        _ icon: SEIIcons,
        renderingMode: Image.TemplateRenderingMode? = .template
    ) {
        self.assetName = icon.assetName
        self.renderingMode = renderingMode
    }

    private init(assetName: String, renderingMode: Image.TemplateRenderingMode?) {
        self.assetName = assetName
        self.renderingMode = renderingMode
    }

    /// Creates a view displaying an icon's filled artwork.
    ///
    /// Only icons listed in ``SEIIconsFilled`` have filled artwork, so
    /// requesting one that doesn't exist is a compile-time error.
    ///
    /// ```swift
    /// SEIIcon.filled(.heart)
    ///     .foregroundStyle(.red)
    /// ```
    public static func filled(
        _ icon: SEIIconsFilled,
        renderingMode: Image.TemplateRenderingMode? = .template
    ) -> SEIIcon {
        SEIIcon(assetName: icon.assetName, renderingMode: renderingMode)
    }

    public var body: some View {
        if let renderingMode {
            Image(assetName, bundle: .module)
                .renderingMode(renderingMode)
        } else {
            Image(assetName, bundle: .module)
        }
    }
}

@available(*, deprecated, renamed: "SEIIcon")
public typealias SxEloIcon = SEIIcon

#Preview("SEIIcon Examples") {
    VStack(spacing: 20) {
        HStack(spacing: 16) {
            SEIIcon(.home)
                .font(.largeTitle)

            SEIIcon(.settings)
                .font(.title)
                .foregroundStyle(.blue)

            SEIIcon(.heart)
                .font(.title)
                .foregroundStyle(.red)
        }

        HStack(spacing: 16) {
            SEIIcon(.lock)
                .foregroundStyle(.green)

            SEIIcon(.star)
                .foregroundStyle(.yellow)

            SEIIcon(.notification)
                .foregroundStyle(.purple)
        }

        HStack(spacing: 16) {
            SEIIcon(.success, renderingMode: .original)

            SEIIcon(.error, renderingMode: .original)

            SEIIcon(.warning, renderingMode: .original)
        }

        HStack(spacing: 16) {
            SEIIcon.filled(.heart)
                .foregroundStyle(.red)

            SEIIcon.filled(.star)
                .foregroundStyle(.yellow)

            SEIIcon.filled(.shield)
                .foregroundStyle(.blue)
        }
    }
    .padding()
}
