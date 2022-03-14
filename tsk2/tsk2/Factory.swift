//
// Created by Ivan Markov on 04.03.2022.
//


final class Factory {
    
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

    func getCarsFromFactory() -> [CarProtocol] {
        let carList: [CarProtocol] = sedanCars + minivanCars + pickupCars + sportCars + superCars
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
        for i in 0..<sedanCars.count {
            assemble(&sedanCars[i])
        }
    }
    
    func assemnleAllMinivans() {
        for i in 0..<minivanCars.count {
            assemble(&minivanCars[i])
        }
    }
    
    func assemnleAllPickups() {
        for i in 0..<pickupCars.count {
            assemble(&pickupCars[i])
        }
    }
    
    func assemnleAllSportCars() {
        for i in 0..<sportCars.count {
            assemble(&sportCars[i])
        }
    }
    
    func assemnleAllSuperCars() {
        for i in 0..<superCars.count {
            assemble(&superCars[i])
        }
    }
    
    private func assemble<T: CarProtocol>(_ car: inout T) {
        car.assemble()
        car.factoryName = factoryName
        Factory.madeCars += 1
    }
    
    func assemnleAllCars() {
        assemnleAllSedans()
        assemnleAllMinivans()
        assemnleAllPickups()
        assemnleAllSportCars()
        assemnleAllSuperCars()
    }
}
