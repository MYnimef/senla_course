//
//  Car.swift
//  tsk2
//
//  Created by Ivan Markov on 03.03.2022.
//

import Foundation


struct CarAttributes {
    
    var wheelsNum: Int = 0
    var doorsNum: Int = 0
}


struct CarPhysicalCpecs {
    
    let weight: Double
    let width: Double
    let length: Double
    let height: Double
    var volume: Double {
        width * length * height
    }
}

struct CarEngine: Equatable {
    
    var name: String = ""
    var maxSpeed: Double = 0
    var velocity: Double = 0
}


enum CarState {
    
    case settingUp
    case working
    case broken
    case modified
}


class Car {

    let modelName: String

    let size: CarPhysicalCpecs
    
    let defaultAttributes: CarAttributes
    var actualAttributes: CarAttributes

    let defaultEngine: CarEngine
    var actualEngine: CarEngine
    
    var state: CarState
    
    var factoryName: String?
    
    init(
            modelName: String,
            size: CarPhysicalCpecs,
            engine: CarEngine,
            attributes: CarAttributes
    ) {
        self.modelName = modelName
        self.size = size
        defaultEngine = engine
        actualEngine = CarEngine()
        defaultAttributes = attributes
        actualAttributes = CarAttributes()
        state = .settingUp
    }

    func assemble() {
        actualAttributes = defaultAttributes
        actualEngine = defaultEngine
        state = .working
    }

    func crash(doorsDecrease: Int = 0, wheelsDecrease: Int = 0) {
        actualAttributes.doorsNum -= doorsDecrease
        actualAttributes.wheelsNum -= wheelsDecrease
        state = .broken
    }

    func repair() {
        actualAttributes = defaultAttributes
        if actualEngine == defaultEngine {
            state = .working
        } else {
            state = .modified
        }
    }

    func modifyEngine(newEngine: CarEngine) {
        actualEngine = newEngine
        state = .modified
    }
    
    func modifyEngine(speedIncrease: Double = 0, velocityIncrease: Double = 0) {
        actualEngine.maxSpeed += speedIncrease
        actualEngine.velocity += velocityIncrease
        state = .modified
    }
}


class Sedan: Car {

    init(modelName: String, size: CarPhysicalCpecs, engine: CarEngine) {
        super.init(
                modelName: modelName,
                size: size,
                engine: engine,
                attributes: CarAttributes(wheelsNum: 4, doorsNum: 2)
        )
    }
    
    func transportMafia() {
        print("Don Craleone has arrived")
    }
}


class Minivan: Car {

    init(modelName: String, size: CarPhysicalCpecs, engine: CarEngine) {
        super.init(
                modelName: modelName,
                size: size,
                engine: engine,
                attributes: CarAttributes(wheelsNum: 4, doorsNum: 4)
        )
    }
    
    func goForVacation() {
        print("This car is perfect for family")
    }
}


class PickUp: Car {

    init(modelName: String, size: CarPhysicalCpecs, engine: CarEngine) {
        super.init(
                modelName: modelName,
                size: size,
                engine: engine,
                attributes: CarAttributes(wheelsNum: 4, doorsNum: 2)
        )
    }
    
    func turnOnCountryMusic() {
        print("Sweet home Alabama")
    }
}


class SportCar: Car {

    init(modelName: String, size: CarPhysicalCpecs, engine: CarEngine) {
        super.init(
            modelName: modelName,
            size: size,
            engine: engine,
            attributes: CarAttributes(wheelsNum: 4, doorsNum: 2)
        )
    }
    
    func driveFast() {
        print("it was too fast")
    }
}


class SuperCar: Car {
    
    init(modelName: String, size: CarPhysicalCpecs, engine: CarEngine) {
        super.init(
            modelName: modelName,
            size: size,
            engine: engine,
            attributes: CarAttributes(wheelsNum: 4, doorsNum: 2)
        )
    }
    
    func fastAndFurious() {
        print("Family.")
    }
}
