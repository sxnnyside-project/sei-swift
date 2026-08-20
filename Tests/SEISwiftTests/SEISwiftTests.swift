// Created by Sxnnyside Project on 30/01/26.

import SwiftUI
import XCTest

@testable import SEISwift

#if canImport(UIKit)
    import UIKit
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit
#endif

final class SEISwiftTests: XCTestCase {

    // MARK: - Icon Catalog Tests

    func testAllIconsHaveValidRawValues() {
        for icon in SEIIcons.allCases {
            XCTAssertFalse(
                icon.rawValue.isEmpty,
                "Icon \(icon) has an empty raw value"
            )
        }
    }

    func testIconAssetNameMatchesRawValue() {
        for icon in SEIIcons.allCases {
            XCTAssertEqual(
                icon.assetName,
                icon.rawValue,
                "Icon \(icon) assetName doesn't match rawValue"
            )
        }
    }

    func testIconCatalogCount() {
        let expectedCount = 120
        XCTAssertEqual(
            SEIIcons.allCases.count,
            expectedCount,
            "Expected \(expectedCount) icons in catalog"
        )
    }

    func testIconUniqueness() {
        let rawValues = SEIIcons.allCases.map { $0.rawValue }
        let uniqueValues = Set(rawValues)

        XCTAssertEqual(
            rawValues.count,
            uniqueValues.count,
            "Duplicate raw values found in SEIIcons enum"
        )
    }

    func testSpecificIconRawValues() {
        XCTAssertEqual(SEIIcons.home.rawValue, "home")
        XCTAssertEqual(SEIIcons.layoutGrid.rawValue, "layout-grid")
        XCTAssertEqual(SEIIcons.lockOpen.rawValue, "lock-open")
        XCTAssertEqual(SEIIcons.chartBar.rawValue, "chart-bar")
        XCTAssertEqual(SEIIcons.linkExternal.rawValue, "link-external")
    }

    // MARK: - Label Convenience Tests

    @MainActor
    func testLabelInitWithStringCompiles() {
        _ = Label("Home", icon: SEIIcons.home)
    }

    @MainActor
    func testLabelInitWithLocalizedStringKeyCompiles() {
        _ = Label(LocalizedStringKey("Home"), icon: SEIIcons.home)
    }

    // MARK: - Filled Icon Catalog Tests

    func testFilledIconCatalogCount() {
        let expectedCount = 23
        XCTAssertEqual(
            SEIIconsFilled.allCases.count,
            expectedCount,
            "Expected \(expectedCount) filled icons in catalog"
        )
    }

    func testFilledIconAssetNameHasFilledSuffix() {
        for icon in SEIIconsFilled.allCases {
            XCTAssertEqual(icon.assetName, "\(icon.rawValue)-filled")
        }
    }

    func testEveryFilledIconHasAnOutlineCounterpart() {
        let outlineRawValues = Set(SEIIcons.allCases.map { $0.rawValue })
        for icon in SEIIconsFilled.allCases {
            XCTAssertTrue(
                outlineRawValues.contains(icon.rawValue),
                "Filled icon \(icon.rawValue) has no outline counterpart in SEIIcons"
            )
        }
    }

    // MARK: - Resource Bundle Resolution
    //
    // Skipped under plain `swift test` (no compiled Assets.car). See CLAUDE.md.

    private static var hasCompiledAssetCatalog: Bool {
        Bundle.module.url(forResource: "Assets", withExtension: "car") != nil
    }

    #if canImport(UIKit)
        func testUIImageLoadingForAllIcons() throws {
            try XCTSkipUnless(Self.hasCompiledAssetCatalog, "Asset catalog not compiled — run via xcodebuild test")
            var failedIcons: [SEIIcons] = []

            for icon in SEIIcons.allCases where UIImage.sei(icon) == nil {
                failedIcons.append(icon)
            }

            XCTAssertTrue(
                failedIcons.isEmpty,
                "Failed to load images for icons: \(failedIcons.map { $0.rawValue })"
            )
        }

        func testUIImageReturnsNonNilForKnownIcons() throws {
            try XCTSkipUnless(Self.hasCompiledAssetCatalog, "Asset catalog not compiled — run via xcodebuild test")
            let knownIcons: [SEIIcons] = [.home, .settings, .lock, .user, .heart]

            for icon in knownIcons {
                XCTAssertNotNil(
                    UIImage.sei(icon),
                    "Failed to load known icon: \(icon.rawValue)"
                )
            }
        }

        func testUIImageLoadingForAllFilledIcons() throws {
            try XCTSkipUnless(Self.hasCompiledAssetCatalog, "Asset catalog not compiled — run via xcodebuild test")
            var failedIcons: [SEIIconsFilled] = []

            for icon in SEIIconsFilled.allCases where UIImage.sei(filled: icon) == nil {
                failedIcons.append(icon)
            }

            XCTAssertTrue(
                failedIcons.isEmpty,
                "Failed to load filled images for icons: \(failedIcons.map { $0.rawValue })"
            )
        }
    #endif

    #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        func testNSImageLoadingForAllIcons() throws {
            try XCTSkipUnless(Self.hasCompiledAssetCatalog, "Asset catalog not compiled — run via xcodebuild test")
            var failedIcons: [SEIIcons] = []

            for icon in SEIIcons.allCases where NSImage.sei(icon) == nil {
                failedIcons.append(icon)
            }

            XCTAssertTrue(
                failedIcons.isEmpty,
                "Failed to load images for icons: \(failedIcons.map { $0.rawValue })"
            )
        }

        func testNSImageReturnsNonNilForKnownIcons() throws {
            try XCTSkipUnless(Self.hasCompiledAssetCatalog, "Asset catalog not compiled — run via xcodebuild test")
            let knownIcons: [SEIIcons] = [.home, .settings, .lock, .user, .heart]

            for icon in knownIcons {
                XCTAssertNotNil(
                    NSImage.sei(icon),
                    "Failed to load known icon: \(icon.rawValue)"
                )
            }
        }

        func testNSImageLoadingForAllFilledIcons() throws {
            try XCTSkipUnless(Self.hasCompiledAssetCatalog, "Asset catalog not compiled — run via xcodebuild test")
            var failedIcons: [SEIIconsFilled] = []

            for icon in SEIIconsFilled.allCases where NSImage.sei(filled: icon) == nil {
                failedIcons.append(icon)
            }

            XCTAssertTrue(
                failedIcons.isEmpty,
                "Failed to load filled images for icons: \(failedIcons.map { $0.rawValue })"
            )
        }
    #endif

    // MARK: - Performance Tests

    func testIconEnumerationPerformance() {
        measure {
            _ = SEIIcons.allCases.map { $0.rawValue }
        }
    }

    #if canImport(UIKit)
        func testUIImageLoadingPerformance() {
            measure {
                for icon in SEIIcons.allCases.prefix(10) {
                    _ = UIImage.sei(icon)
                }
            }
        }
    #endif
}
