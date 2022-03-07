//
// Created by Ivan Markov on 04.03.2022.
//

import Foundation


class Factory {
    
    static var madeCars: Int = 0
    
    private var sedanCars: [Sedan] = []
    private var minivanCars: [Minivan] = []
    private var pickupCars: [PickUp] = []
    private var sportCars: [SportCar] = []
    private var superCars: [SuperCar] = []
    
    let factoryName: String
    
    init(factoryName: String) {
        self.factoryName = factoryName
    }

    func getCarsFromFactory() -> [Car] {
        let carList: [Car] = sedanCars + minivanCars + pickupCars + sportCars + superCars
        sedanCars.removeAll()
        minivanCars.removeAll()
        pickupCars.removeAll()
        sportCars.removeAll()
        superCars.removeAll()
        return carList
    }
    
    func makeCar(_ car: Sedan) {
        sedanCars.append(car)
    }
    
    func makeCar(_ car: Minivan) {
        minivanCars.append(car)
    }
    
    func makeCar(_ car: PickUp) {
        pickupCars.append(car)
    }
    
    func makeCar(_ car: SportCar) {
        sportCars.append(car)
    }
    
    func makeCar(_ car: SuperCar) {
        superCars.append(car)
    }
    
    func assemnleAllSedans() {
        for car in sedanCars {
            assemnleCar(car)
        }
    }
    
    func assemnleAllMinivans() {
        for car in minivanCars {
            assemnleCar(car)
        }
    }
    
    func assemnleAllPickups() {
        for car in pickupCars {
            assemnleCar(car)
        }
    }
    
    func assemnleAllSportCars() {
        for car in sportCars {
            assemnleCar(car)
        }
    }
    
    func assemnleAllSuperCars() {
        for car in superCars {
            assemnleCar(car)
        }
    }
    
    func assemnleAllCars() {
        assemnleAllSedans()
        assemnleAllMinivans()
        assemnleAllPickups()
        assemnleAllSportCars()
        assemnleAllSuperCars()
    }
    
    private func assemnleCar(_ car: Car) {
        car.assemble()
        car.factoryName = factoryName
        Factory.madeCars += 1
    }
}
