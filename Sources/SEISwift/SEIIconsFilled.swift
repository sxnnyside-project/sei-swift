// Created by Sxnnyside Project on 20/08/26.

/// Type-safe catalog of icons that have filled artwork.
///
/// Not every icon in ``SEIIcons`` has a filled variant. `SEIIconsFilled`
/// contains only the subset that does, so requesting a nonexistent filled
/// icon is a compile-time error via ``SEIIcon/filled(_:renderingMode:)``,
/// not a runtime failure.
public enum SEIIconsFilled: String, CaseIterable, Sendable {
    case badge
    case check
    case crown
    case error
    case flame
    case folder
    case globe
    case heart
    case help
    case home
    case info
    case lock
    case message
    case more
    case notification
    case shield
    case sound
    case star
    case success
    case user
    case verified
    case warning
    case wifi

    /// The asset catalog name for this icon's filled artwork.
    public var assetName: String { "\(rawValue)-filled" }
}
