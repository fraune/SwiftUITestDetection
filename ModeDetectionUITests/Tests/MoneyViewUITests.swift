//
//  MoneyViewUITests.swift
//  ModeDetectionUITests
//
//  Created by fraune on 10/17/24.
//

import XCTest

final class MoneyViewUITests: XCTestCase {
    func test_moneyBags_displays() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Show me the money!"].tap()

        XCTAssertTrue(app.staticTexts["Here is the money -> 💰💰💰"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.staticTexts["UI_Test=true"].waitForExistence(timeout: 1))
    }
}
