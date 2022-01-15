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
        let details = """
            Make: \(make)
            Model: \(model)
            Top Speed: \(topSpeed)mph
            Acceleration (0-60 in): \(acceleration)s
            Handling: \(handling)
        """
        return details
    }
}
