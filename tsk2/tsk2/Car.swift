//
//  Car.swift
//  tsk2
//
//  Created by Ivan Markov on 03.03.2022.
//

import Foundation


struct Attributes {
    
    var wheelsNum: Int = 0
    var doorsNum: Int = 0
}


struct CarAttributes {
    
    let defaultAttributes: Attributes
    var attributes: Attributes?
    
    init(wheelsNum: Int, doorsNum: Int) {
        defaultAttributes = Attributes(wheelsNum: wheelsNum, doorsNum: doorsNum)
    }
    
    mutating func changeAttributes(wheelsNum: Int, doorsNum: Int) {
        if attributes != nil {
            attributes!.wheelsNum = wheelsNum
            attributes!.doorsNum = doorsNum
        } else {
            attributes = Attributes(wheelsNum: wheelsNum, doorsNum: doorsNum)
        }
    }
    
    mutating func changeAttributes(wheelsDecrease: Int, doorsDecrease: Int) {
        if attributes != nil {
            attributes!.wheelsNum -= wheelsDecrease
            attributes!.doorsNum -= doorsDecrease
        } else {
            print("Can't decrease not finished car")
        }
    }
}


struct PhysicalCpecs {
    
    let weight: Double
    let width: Double
    let length: Double
    let height: Double
    var volume: Double {
        width * length * height
    }
}


struct EngineCharacteristics: Equatable {
    
    var maxSpeed: Double
    var velocity: Double
}


struct Engine {
    
    var name: String
    let defaultCharacteristics: EngineCharacteristics
    var characteristics: EngineCharacteristics?
    
    init(name: String, maxSpeed: Double, velocity: Double) {
        self.name = name
        self.defaultCharacteristics = EngineCharacteristics(maxSpeed: maxSpeed, velocity: velocity)
    }
    
    mutating func upgradeEngine(speedIncrease: Double, velocityIncrease: Double) {
        if characteristics != nil {
            characteristics!.maxSpeed += speedIncrease
            characteristics!.velocity += velocityIncrease
        } else {
            print("Can't upgrade not finished engine")
        }
    }
    
    func checkForModifications() -> Bool {
        if defaultCharacteristics == characteristics {
            return true
        }
        return false
    }
}


enum CarState {
    
    case settingUp
    case working
    case broken
    case modified
}


protocol CarProtocol {
    
    var modelName: String { get }
    var physicalSpecs: PhysicalCpecs { get }
    var attributes: CarAttributes { get set }
    var engine: Engine { get set }
    var state: CarState { get set }
    var factoryName: String? { get set }
    
    mutating func assemble()
    mutating func crash(doorsDecrease: Int, wheelsDecrease: Int)
    mutating func repair()
    mutating func modifyEngine(newEngine: Engine)
    mutating func modifyEngine(speedIncrease: Double, velocityIncrease: Double)
}


extension CarProtocol {

    mutating func assemble() {
        state = .working
    }

    mutating func crash(doorsDecrease: Int = 0, wheelsDecrease: Int = 0) {
        attributes.changeAttributes(wheelsDecrease: wheelsDecrease, doorsDecrease: doorsDecrease)
        state = .broken
    }

    mutating func repair() {
        attributes.attributes = attributes.defaultAttributes
        state = engine.checkForModifications() ? .modified : .working
    }

    mutating func modifyEngine(newEngine: Engine) {
        engine = newEngine
        state = .modified
    }
    
    mutating func modifyEngine(speedIncrease: Double = 0, velocityIncrease: Double = 0) {
        engine.upgradeEngine(speedIncrease: speedIncrease, velocityIncrease: velocityIncrease)
        state = .modified
    }
}


protocol SedanProtocol {
    
    var gunsAmount: Int { get set }
    
    func shootWithAllTheGuns()
    func transportMafia()
}


extension SedanProtocol {
    
    func shootWithAllTheGuns() {
        print("Shooting our enemy from all of the \(gunsAmount) guns")
    }
    
    func transportMafia() {
        print("Don Craleone has arrived")
    }
}


struct Sedan: CarProtocol, SedanProtocol {
    
    var modelName: String
    var physicalSpecs: PhysicalCpecs
    var attributes = CarAttributes(wheelsNum: 4, doorsNum: 4)
    var engine: Engine
    var state: CarState = .settingUp
    var factoryName: String?
    
    var gunsAmount: Int
}


protocol MinivanProtocol {
    
    var familyMembersAmount: Int { get set }
    var doesHaveDad: Bool { get set }
    var doesHaveMom: Bool { get set }
    
    func singASong()
    func goForVacation()
}


extension MinivanProtocol {
    
    func singASong() {
        print(
            "\(familyMembersAmount == 0 ? "We don't exist, this song is a" : "We") ride to the trip" + "\n" +
            "Where \(familyMembersAmount == 0 ? "noone" : "we") are gonna have a good time" + "\n" +
            "Our dad is + \(doesHaveDad ? "so strong" : "dead")" + "\n" +
            "And our mom is + \(doesHaveMom ? "so beautiful" : "is a 🙊")"
        )
    }
    
    func goForVacation() {
        print("This car is perfect for family")
    }
}


struct Minivan: CarProtocol, MinivanProtocol {
    
    var modelName: String
    var physicalSpecs: PhysicalCpecs
    var attributes = CarAttributes(wheelsNum: 4, doorsNum: 4)
    var engine: Engine
    var state: CarState = .settingUp
    var factoryName: String?
    
    var familyMembersAmount: Int
    var doesHaveDad: Bool
    var doesHaveMom: Bool
}


protocol PickupProtocol {
    
    func turnOnCountryMusic()
}


extension PickupProtocol {
    
    func turnOnCountryMusic() {
        print("Sweet home Alabama")
    }
}


struct PickUp: CarProtocol, PickupProtocol {
    
    var modelName: String
    var physicalSpecs: PhysicalCpecs
    var attributes = CarAttributes(wheelsNum: 4, doorsNum: 2)
    var engine: Engine
    var state: CarState = .settingUp
    var factoryName: String?
}


protocol SportCarProtocol {
    
    func driveFast()
}


extension SportCarProtocol {
    
    func driveFast() {
        print("it was too fast")
    }
}


struct SportCar: CarProtocol, SportCarProtocol {
    
    var modelName: String
    var physicalSpecs: PhysicalCpecs
    var attributes = CarAttributes(wheelsNum: 4, doorsNum: 2)
    var engine: Engine
    var state: CarState = .settingUp
    var factoryName: String?
}


protocol SuperCarProtocol {
    
    func fastAndFurious()
}


extension SuperCarProtocol {
    
    func fastAndFurious() {
        print("Family.")
    }
}


struct SuperCar: CarProtocol, SuperCarProtocol {
    
    var modelName: String
    var physicalSpecs: PhysicalCpecs
    var attributes: CarAttributes = CarAttributes(wheelsNum: 4, doorsNum: 2)
    var engine: Engine
    var state: CarState = .settingUp
    var factoryName: String?
}
