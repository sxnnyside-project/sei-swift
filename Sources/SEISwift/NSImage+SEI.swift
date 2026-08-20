// Created by Sxnnyside Project on 30/01/26.

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit

    /// AppKit extensions for Sxnnyside Eloquent Icons.
    extension NSImage {
        /// Loads a Sxnnyside Eloquent Icon as an `NSImage`.
        ///
        /// ```swift
        /// let homeIcon = NSImage.sei(.home)
        /// imageView.image = homeIcon
        /// ```
        ///
        /// - Parameter icon: The icon to load.
        /// - Returns: An `NSImage` instance, or `nil` if the icon cannot be loaded.
        public static func sei(_ icon: SEIIcons) -> NSImage? {
            Bundle.module.image(forResource: icon.assetName)
        }

        /// Loads a Sxnnyside Eloquent Icon's filled artwork as an `NSImage`.
        ///
        /// - Parameter icon: The filled icon to load.
        /// - Returns: An `NSImage` instance, or `nil` if the icon cannot be loaded.
        public static func sei(filled icon: SEIIconsFilled) -> NSImage? {
            Bundle.module.image(forResource: icon.assetName)
        }
    }
#endif
