//
//  Car.swift
//  CarCustomiser
//
//  Created by Compton-Burnett, Peter (PGW) on 13/01/2022.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func getDetails() -> String{
        let details = "Make: \(self.make)\nModel: \(self.model)\nTop Speed: \(self.topSpeed)mph\nAcceleration (0-60): \(self.acceleration)s\nHandling: \(self.handling)\n"
        return details
    }
}
