// Created by Sxnnyside Project on 30/01/26.

import Foundation

/// SEISwift – Sxnnyside Eloquent Icons for Swift
///
/// SEISwift provides native, type-safe access to the complete catalog of
/// Sxnnyside Eloquent Icons for both SwiftUI and UIKit applications.
///
/// ## Overview
///
/// This package offers a clean, modern API for integrating high-quality icons
/// into your Swift applications with zero configuration and full platform support.
///
/// ## Topics
///
/// ### Icon Catalog
///
/// - ``SEIIcon``
///
/// ### SwiftUI Components
///
/// - ``SxEloIcon``
///
/// ### UIKit Extensions
///
/// - ``UIImage/sei(_:)``
///
/// ## Getting Started
///
/// ### SwiftUI
///
/// ```swift
/// import SwiftUI
/// import SEISwift
///
/// struct ContentView: View {
///     var body: some View {
///         SxEloIcon(.home)
///             .foregroundStyle(.blue)
///             .font(.title)
///     }
/// }
/// ```
///
/// ### UIKit
///
/// ```swift
/// import UIKit
/// import SEISwift
///
/// let imageView = UIImageView(image: .sei(.home))
/// imageView.tintColor = .systemBlue
/// ```
