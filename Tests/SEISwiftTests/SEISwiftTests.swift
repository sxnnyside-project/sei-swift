// Created by Sxnnyside Project on 30/01/26.

import XCTest
@testable import SEISwift

#if canImport(UIKit)
import UIKit
#endif

final class SEISwiftTests: XCTestCase {
    
    // MARK: - Icon Catalog Tests
    
    func testAllIconsHaveValidRawValues() {
        // Validate that all enum cases have non-empty raw values
        for icon in SEIIcon.allCases {
            XCTAssertFalse(
                icon.rawValue.isEmpty,
                "Icon \(icon) has an empty raw value"
            )
        }
    }
    
    func testIconAssetNameMatchesRawValue() {
        // Validate that assetName returns the correct value
        for icon in SEIIcon.allCases {
            XCTAssertEqual(
                icon.assetName,
                icon.rawValue,
                "Icon \(icon) assetName doesn't match rawValue"
            )
        }
    }
    
    func testIconCatalogCount() {
        // Ensure we have the expected number of icons
        let expectedCount = 120
        XCTAssertEqual(
            SEIIcon.allCases.count,
            expectedCount,
            "Expected \(expectedCount) icons in catalog"
        )
    }
    
    // MARK: - UIKit Tests
    
    #if canImport(UIKit)
    func testUIImageLoadingForAllIcons() {
        // Validate that all icons can be loaded as UIImage
        var failedIcons: [SEIIcon] = []
        
        for icon in SEIIcon.allCases {
            if UIImage.sei(icon) == nil {
                failedIcons.append(icon)
            }
        }
        
        XCTAssertTrue(
            failedIcons.isEmpty,
            "Failed to load images for icons: \(failedIcons.map { $0.rawValue })"
        )
    }
    
    func testUIImageReturnsNonNilForKnownIcons() {
        // Test specific known icons
        let knownIcons: [SEIIcon] = [.home, .settings, .lock, .user, .heart]
        
        for icon in knownIcons {
            XCTAssertNotNil(
                UIImage.sei(icon),
                "Failed to load known icon: \(icon.rawValue)"
            )
        }
    }
    #endif
    
    // MARK: - Enum Tests
    
    func testIconUniqueness() {
        // Validate that all raw values are unique
        let rawValues = SEIIcon.allCases.map { $0.rawValue }
        let uniqueValues = Set(rawValues)
        
        XCTAssertEqual(
            rawValues.count,
            uniqueValues.count,
            "Duplicate raw values found in SEIIcon enum"
        )
    }
    
    func testSpecificIconRawValues() {
        // Validate specific icon mappings
        XCTAssertEqual(SEIIcon.home.rawValue, "home")
        XCTAssertEqual(SEIIcon.layoutGrid.rawValue, "layout-grid")
        XCTAssertEqual(SEIIcon.lockOpen.rawValue, "lock-open")
        XCTAssertEqual(SEIIcon.chartBar.rawValue, "chart-bar")
        XCTAssertEqual(SEIIcon.linkExternal.rawValue, "link-external")
    }
    
    // MARK: - Performance Tests
    
    func testIconEnumerationPerformance() {
        measure {
            _ = SEIIcon.allCases.map { $0.rawValue }
        }
    }
    
    #if canImport(UIKit)
    func testUIImageLoadingPerformance() {
        measure {
            for icon in SEIIcon.allCases.prefix(10) {
                _ = UIImage.sei(icon)
            }
        }
    }
    #endif
}
