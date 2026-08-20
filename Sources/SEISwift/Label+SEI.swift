// Created by Sxnnyside Project on 20/08/26.

import SwiftUI

extension Label where Title == Text, Icon == SEIIcon {
    /// Creates a label with an SEI icon and a title generated from a string.
    @MainActor
    public init(_ title: some StringProtocol, icon: SEIIcons) {
        self.init {
            Text(title)
        } icon: {
            SEIIcon(icon)
        }
    }

    /// Creates a label with an SEI icon and a localized title.
    @MainActor
    public init(_ titleKey: LocalizedStringKey, icon: SEIIcons) {
        self.init {
            Text(titleKey)
        } icon: {
            SEIIcon(icon)
        }
    }
}
