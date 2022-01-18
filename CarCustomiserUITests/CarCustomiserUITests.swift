2//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Compton-Burnett, Peter (PGW) on 13/01/2022.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This  method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTiresAndExhaustPackageOtherTwoUpgradesAreDisabled() throws {
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //act
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust Package"]/*[[".cells[\"Exhaust Package\"].switches[\"Exhaust Package\"]",".switches[\"Exhaust Package\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package"]/*[[".cells[\"Tires Package\"].switches[\"Tires Package\"]",".switches[\"Tires Package\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        //assert
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Turbo Package"]/*[[".cells[\"Turbo Package\"].switches[\"Turbo Package\"]",".switches[\"Turbo Package\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Engine Upgrade Package"]/*[[".cells[\"Engine Upgrade Package\"].switches[\"Engine Upgrade Package\"]",".switches[\"Engine Upgrade Package\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        
    }
    
    func testWhenClickedNextCarAnotherCarSelected() throws {
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let current = car.model
        //act
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.buttons["Next Car"]/*[[".cells[\"    Make: Ariel\\n    Model: Atom\\n    Top Speed: 149mph\\n    Acceleration (0-60 in): 2.1s\\n    Handling: 9, Next Car\"].buttons[\"Next Car\"]",".buttons[\"Next Car\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //assert
        XCTAssertNotEqual(car.model, current)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
