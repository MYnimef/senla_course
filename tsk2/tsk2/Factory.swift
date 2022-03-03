//
// Created by Ivan Markov on 04.03.2022.
//

import Foundation


struct FactoryCars {
    static let audiS3 = SportCar(
            modelName: "Audi S3 Sportback",
            size: CarSize(weight: 1500, width: 1816, length: 4351, height: 1816),
            engine: "TFSI"
    )
    static let bmwX5 = SuperCar(
            modelName: "BMW X5",
            size: CarSize(weight: 1550, width: 1806, length: 4651, height: 1916),
            engine: "XXXI"
    )
    static let tomcat = PickUp(
            modelName: "Tomcat",
            size: CarSize(weight: 15000, width: 18160, length: 43510, height: 18160),
            engine: "FURICH"
    )
    static let mercedes = Sedan(
            modelName: "Mercedes",
            size: CarSize(weight: 1500, width: 1816, length: 4351, height: 1816),
            engine: "WRUM"
    )
}


class Factory {
    private var cars: [Car]

    init() {
        cars = []
    }

    func getCarsFromFactory() -> [Car] {
        let carList = cars
        cars = []
        return carList
    }

    func startMakingAudi() {
        cars.append(FactoryCars.audiS3.copy() as! Car)
    }

    func startMakingBmw() {
        cars.append(FactoryCars.bmwX5.copy() as! Car)
    }

    func startMakingTomcat() {
        cars.append(FactoryCars.tomcat.copy() as! Car)
    }

    func startMakingMercedes() {
        cars.append(FactoryCars.mercedes.copy() as! Car)
    }

    func makeAllCars() {
        for car in cars {
            car.assemble()
        }
    }
}
