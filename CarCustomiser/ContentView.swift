//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Compton-Burnett, Peter (PGW) on 13/01/2022.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    var body: some View {
        Text("Car Make: \(car.getDetails())")
            .padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
