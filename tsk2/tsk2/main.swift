//
//  main.swift
//  tsk2
//
//  Created by Ivan Markov on 03.03.2022.
//


let diller = Diller()
let factory = Factory(factoryName: "АВТОВАЗ", dillerDelegate: diller)

factory.makeCar(PickUp(
    modelName: "Tomcat",
    physicalSpecs: PhysicalCpecs(weight: 15000, width: 18160, length: 43510, height: 18160),
    engine: Engine(name: "FURICH", maxSpeed: 100, velocity: 70)
))
factory.makeCar(SuperCar(
    modelName: "BMW X5",
    physicalSpecs: PhysicalCpecs(weight: 1550, width: 1806, length: 4651, height: 1916),
    engine: Engine(name: "XXXI", maxSpeed: 200, velocity: 100)
))
factory.makeCar(SportCar(
    modelName: "Audi S3 Sportback",
    physicalSpecs: PhysicalCpecs(weight: 1500, width: 1816, length: 4351, height: 1816),
    engine: Engine(name: "TFSI", maxSpeed: 150, velocity: 90)
))
factory.makeCar(Sedan(
    modelName: "Mercedes",
    physicalSpecs: PhysicalCpecs(weight: 1500, width: 1816, length: 4351, height: 1816),
    engine: Engine(name: "WRUM", maxSpeed: 120, velocity: 80),
    gunsAmount: 5
))

for car in diller.getCars() {
    var madeBy: String
    if let factory = car.factoryName {
        madeBy = "made by " + factory
    } else {
        madeBy = ""
    }
    
    print("Car \(car.modelName) \(madeBy) is \(car.state == .working ? "ready" : "not ready")")
}

print(Factory.madeCars)

