//
//  ContentViewUITests.swift
//  ModeDetectionUITests
//
//  Created by fraune on 10/17/24.
//

import XCTest

final class ContentViewUITests: XCTestCase {
    func test_helloWorld_displays() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["UI_Test=true"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.staticTexts["Hello, world!"].waitForExistence(timeout: 1))
    }
}
