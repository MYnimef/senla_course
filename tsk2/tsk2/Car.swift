//
//  Car.swift
//  tsk2
//
//  Created by Ivan Markov on 03.03.2022.
//

import Foundation


struct CarAttributes {
    
    var wheelsNum: Int
    var doorsNum: Int

    init(wheelsNum: Int, doorsNum: Int) {
        self.wheelsNum = wheelsNum
        self.doorsNum = doorsNum
    }

    init() {
        wheelsNum = 0
        doorsNum = 0
    }
}


struct CarSize {
    
    let weight: Double
    let width: Double
    let length: Double
    let height: Double
    var volume: Double {
        width * length * height
    }
}


enum CarState {
    
    case settingUp
    case working
    case broken
    case modified
}


class Car: NSCopying {

    let modelName: String

    let size: CarSize
    
    let defaultAttributes: CarAttributes
    var actualAttributes: CarAttributes

    let defaultEngine: String
    var actualEngine: String

    private let specialAction: () -> ()
    
    var state: CarState
    
    init(
            modelName: String,
            size: CarSize,
            engine: String,
            attributes: CarAttributes,
            specialAction: @escaping () -> ()
    ) {
        self.modelName = modelName
        self.size = size
        defaultEngine = engine
        actualEngine = ""
        defaultAttributes = attributes
        actualAttributes = CarAttributes()
        self.specialAction = specialAction
        state = .settingUp
    }

    init(
            modelName: String,
            size: CarSize,
            defaultAttributes: CarAttributes,
            actualAttributes: CarAttributes,
            defaultEngine: String,
            actualEngine: String,
            specialAction: @escaping () -> (),
            state: CarState
    ) {
        self.modelName = modelName
        self.size = size
        self.defaultAttributes = defaultAttributes
        self.actualAttributes = actualAttributes
        self.defaultEngine = defaultEngine
        self.actualEngine = actualEngine
        self.specialAction = specialAction
        self.state = state
    }

    func assemble() {
        actualAttributes = defaultAttributes
        actualEngine = defaultEngine
        state = .working
    }

    func crash() {
        state = .broken
    }

    func crash(doorsAmount: Int) {
        actualAttributes.doorsNum = doorsAmount
        state = .broken
    }

    func crash(wheelsAmount: Int) {
        actualAttributes.wheelsNum = wheelsAmount
        state = .broken
    }

    func crash(doorsAmount: Int, wheelsAmount: Int) {
        actualAttributes.doorsNum = doorsAmount
        actualAttributes.wheelsNum = wheelsAmount
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

    func modifyEngine(newEngine: String) {
        actualEngine = newEngine
        state = .modified
    }

    func action() {
        specialAction()
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Car(
                modelName: modelName,
                size: size,
                defaultAttributes: defaultAttributes,
                actualAttributes: actualAttributes,
                defaultEngine: defaultEngine,
                actualEngine: actualEngine,
                specialAction: specialAction,
                state: state
        )
    }
}


class Sedan: Car {

    init(modelName: String, size: CarSize, engine: String) {
        super.init(
                modelName: modelName,
                size: size,
                engine: engine,
                attributes: CarAttributes(wheelsNum: 4, doorsNum: 2),
                specialAction: {
                    print("This car is perfect for mafia")
                }
        )
    }
}


class Minivan: Car {

    init(modelName: String, size: CarSize, engine: String) {
        super.init(
                modelName: modelName,
                size: size,
                engine: engine,
                attributes: CarAttributes(wheelsNum: 4, doorsNum: 4),
                specialAction: {
                    print("This car is perfect for family")
                }
        )
    }
}


class PickUp: Car {

    init(modelName: String, size: CarSize, engine: String) {
        super.init(
                modelName: modelName,
                size: size,
                engine: engine,
                attributes: CarAttributes(wheelsNum: 4, doorsNum: 2),
                specialAction: {
                    print("This car is perfect for transporting some things")
                }
        )
    }
}


class SportCar: Car {

    init(modelName: String, size: CarSize, engine: String) {
        super.init(
                modelName: modelName,
                size: size,
                engine: engine,
                attributes: CarAttributes(wheelsNum: 4, doorsNum: 2),
                specialAction: {
                    print("This car is really fast")
                }
        )
    }
}


class SuperCar: Car {
    init(modelName: String, size: CarSize, engine: String) {
        super.init(
                modelName: modelName,
                size: size,
                engine: engine,
                attributes: CarAttributes(wheelsNum: 4, doorsNum: 2),
                specialAction: {
                    print("This is a luxury car for the best")
                }
        )
    }
}
