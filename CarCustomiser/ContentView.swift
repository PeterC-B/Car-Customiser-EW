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
    
    @State private var money = 1000
    @State private var remainingTime = 30
    
    @State var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeUp = false
    
    var exhaustPackageEnabled: Bool {
        return exhaustPackage ? true : money >= 500 ? true : false
    }
    
    var tiresPackageEnabled: Bool {
        return tiresPackage ? true : money >= 500 ? true : false
    }
    
    var turboPackageEnabled: Bool {
        return turboPackage ? true : money >= 500 ? true : false
    }
    
    var engineUpgradePackageEnabled: Bool {
        return engineUpgradePackage ? true : money >= 500 ? true : false
    }
    
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage},
            set: { newValue in
                if remainingTime <= 0{
                    return
                }
                if newValue == true{
                    if money < 45{
                        return
                    }
                    else {
                        money -= 45
                    }
                    self.exhaustPackage = newValue
                    starterCars.cars[selectedCar].topSpeed += 5
                    
                        
                    }
                else {
                    money += 45
                    self.exhaustPackage = newValue
                    starterCars.cars[selectedCar].topSpeed -= 5
                        
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get : { self.tiresPackage},
            set: { newValue in
                if remainingTime <= 0{
                    return
                }
                if newValue == true{
                    if money < 19{
                        return
                    }
                    else {
                        money -= 19
                    }
                    self.tiresPackage = newValue
                    starterCars.cars[selectedCar].handling += 2
                    
                        
                    }
                else {
                    money += 19
                    self.tiresPackage = newValue
                    starterCars.cars[selectedCar].handling -= 2
                        
                }
            }
        )
        
        let turboPackageBinding = Binding<Bool> (
            get : { self.turboPackage},
            set: { newValue in
                if remainingTime <= 0{
                    return
                }
                if newValue == true{
                    if money < 35{
                        return
                    }
                    else {
                        money -= 35
                    }
                    self.turboPackage = newValue
                    starterCars.cars[selectedCar].topSpeed += 21
                    
                        
                    }
                else {
                    money += 35
                    self.turboPackage = newValue
                    starterCars.cars[selectedCar].topSpeed -= 21
                        
                }
            }
        )
        
        let engineUpgradePackageBinding = Binding<Bool> (
            get : { self.engineUpgradePackage},
            set: { newValue in
                if remainingTime <= 0{
                    return
                }
                if newValue == true{
                    if money < 60{
                        return
                    }
                    else {
                        money -= 60
                    }
                    self.engineUpgradePackage = newValue
                    starterCars.cars[selectedCar].topSpeed += 15
                    starterCars.cars[selectedCar].acceleration -= 0.75
                    
                        
                    }
                else {
                    money += 60
                    self.engineUpgradePackage = newValue
                    starterCars.cars[selectedCar].topSpeed -= 15
                    starterCars.cars[selectedCar].acceleration += 0.75
                        
                }
            }
        )
        VStack {
            Text("\(remainingTime)")
                .onReceive(timer) { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    }
                    
                }
                .foregroundColor(.red)
            Form {
                VStack(alignment: .leading, spacing: 20){
                    Text("\(starterCars.cars[selectedCar].getDetails())")
                        .padding()
                    
                    Button("Next Car", action: {
                        if remainingTime <= 0{
                            return
                        }
                        if selectedCar+1 < self.starterCars.cars.count {
                            selectedCar += 1
                        }
                        else {
                            selectedCar = 0
                        }
                        resetValues()
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
        
        
        Text("\(timeRemaining)")
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                        else {
                            timeUp = true
                        }
                    }
        
        Text("Remaining Funds: \(money)")
            .foregroundColor(.red)
            .baselineOffset(20)
        
        

    }
    
    func resetValues() {
        money = 1000
        exhaustPackage = false
        tiresPackage = false
        turboPackage = false
        engineUpgradePackage = false
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
