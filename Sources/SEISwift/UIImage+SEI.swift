// Created by Sxnnyside Project on 30/01/26.

#if canImport(UIKit)
import UIKit

/// UIKit extensions for Sxnnyside Eloquent Icons.
extension UIImage {
    /// Loads a Sxnnyside Eloquent Icon as a UIImage.
    ///
    /// This method provides a convenient way to load SEI icons in UIKit applications.
    /// The image is loaded from the module's bundle and is compatible with UIImageView,
    /// UIButton, and other UIKit components.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let homeIcon = UIImage.sei(.home)
    /// let settingsIcon = UIImage.sei(.settings)
    ///
    /// imageView.image = homeIcon
    /// button.setImage(settingsIcon, for: .normal)
    /// ```
    ///
    /// - Parameter icon: The icon to load.
    /// - Returns: A UIImage instance, or `nil` if the icon cannot be loaded.
    public static func sei(_ icon: SEIIcon) -> UIImage? {
        UIImage(named: icon.assetName, in: .module, compatibleWith: nil)
    }
}
#endif
