// Created by Sxnnyside Project on 30/01/26.

#if canImport(UIKit)
    import UIKit

    /// UIKit extensions for Sxnnyside Eloquent Icons.
    extension UIImage {
        /// Loads a Sxnnyside Eloquent Icon as a `UIImage`.
        ///
        /// ```swift
        /// let homeIcon = UIImage.sei(.home)
        /// imageView.image = homeIcon
        /// button.setImage(UIImage.sei(.settings), for: .normal)
        /// ```
        ///
        /// - Parameter icon: The icon to load.
        /// - Returns: A `UIImage` instance, or `nil` if the icon cannot be loaded.
        public static func sei(_ icon: SEIIcons) -> UIImage? {
            UIImage(named: icon.assetName, in: .module, compatibleWith: nil)
        }

        /// Loads a Sxnnyside Eloquent Icon's filled artwork as a `UIImage`.
        ///
        /// - Parameter icon: The filled icon to load.
        /// - Returns: A `UIImage` instance, or `nil` if the icon cannot be loaded.
        public static func sei(filled icon: SEIIconsFilled) -> UIImage? {
            UIImage(named: icon.assetName, in: .module, compatibleWith: nil)
        }
    }
#endif
