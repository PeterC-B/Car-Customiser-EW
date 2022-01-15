//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Compton-Burnett, Peter (PGW) on 13/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State var starterCars =  StarterCars()
    @State private var selectedCar: Int = 1
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var turboPackage = false
    @State private var engineUpgradePackage = false
    
    @State private var money = 200
    
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage},
            set: { newValue in
                if money < 45{
                    return
                }
                else {
                    money -= 45
                }
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get : { self.tiresPackage},
            set: { newValue in
                if money < 19{
                    return
                }
                else {
                    money -= 19
                }
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        
        let turboPackageBinding = Binding<Bool> (
            get : { self.turboPackage},
            set: { newValue in
                if money < 35{
                    return
                }
                else {
                    money -= 35
                }
                self.turboPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 21
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 21
                }
            }
        )
        
        let engineUpgradePackageBinding = Binding<Bool> (
            get : { self.engineUpgradePackage},
            set: { newValue in
                if money < 60{
                    return
                }
                else {
                    money -= 60
                }
                self.engineUpgradePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 15
                    starterCars.cars[selectedCar].acceleration -= 0.75
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 15
                    starterCars.cars[selectedCar].acceleration += 0.75
                }
            }
        )
        
        Form {
            VStack(alignment: .leading, spacing: 20){
                Text("\(starterCars.cars[selectedCar].getDetails())")
                    .padding()
                Text("Money \(money)")
                    .padding()
                Button("Next Car", action: {
                    if selectedCar+1 < self.starterCars.cars.count {
                        selectedCar += 1
                    }
                    else {
                        selectedCar = 0
                    }
                    self.exhaustPackage = false
                    self.tiresPackage = false
                    self.turboPackage = false
                    self.engineUpgradePackage = false
                    //selectedCar = Int.random(in:0..<self.starterCars.cars.count)
                })
            }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                Toggle("Tires Package", isOn: tiresPackageBinding)
                Toggle("Turbo Package", isOn: turboPackageBinding)
                Toggle("Engine Upgrade Package", isOn: engineUpgradePackageBinding)
            }
        }
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
