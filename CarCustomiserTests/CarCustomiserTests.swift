//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Compton-Burnett, Peter (PGW) on 13/01/2022.
//

import XCTest

class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet() {
        //arrange
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    func testNewCarDetailsFunctionReturnsExpectedValues() {
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        XCTAssertEqual(car.getDetails(), "Make: Mazda\nModel: MX-5\nTop Speed: 125mph\nAcceleration (0-60): 7.7s\nH andling: 5\n")
    }

}
