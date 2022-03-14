//
// Created by Ivan Markov on 04.03.2022.
//


class Factory {
    
    static var madeCars: Int = 0
    
    private var sedanCars: [Sedan] = []
    private var minivanCars: [Minivan] = []
    private var pickupCars: [PickUp] = []
    private var sportCars: [SportCar] = []
    private var superCars: [SuperCar] = []
    
    weak var dillerDelegate: Diller?
    
    let factoryName: String
    
    init(factoryName: String, dillerDelegate: Diller) {
        self.factoryName = factoryName
        self.dillerDelegate = dillerDelegate
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
        var factoryCar = car
        assemble(&factoryCar)
        dillerDelegate?.addSedan(factoryCar)
    }
    
    func makeCar(_ car: Minivan) {
        var factoryCar = car
        assemble(&factoryCar)
        dillerDelegate?.addMinivan(factoryCar)
    }
    
    func makeCar(_ car: PickUp) {
        var factoryCar = car
        assemble(&factoryCar)
        dillerDelegate?.addPickup(factoryCar)
    }
    
    func makeCar(_ car: SportCar) {
        var factoryCar = car
        assemble(&factoryCar)
        dillerDelegate?.addSportcar(factoryCar)
    }
    
    func makeCar(_ car: SuperCar) {
        var factoryCar = car
        assemble(&factoryCar)
        dillerDelegate?.addSupercar(factoryCar)
    }
    
    private func assemble<T: CarProtocol>(_ car: inout T) {
        car.assemble()
        car.factoryName = factoryName
        Factory.madeCars += 1
    }
}


protocol DillerProtocol: AnyObject {
    
    func getCars() -> [CarProtocol]
    func addSedan(_ car: Sedan)
    func addMinivan(_ car: Minivan)
    func addPickup(_ car: PickUp)
    func addSportcar(_ car: SportCar)
    func addSupercar(_ car: SuperCar)
}


class Diller {
    
    private var sedanCars: [Sedan] = []
    private var minivanCars: [Minivan] = []
    private var pickupCars: [PickUp] = []
    private var sportCars: [SportCar] = []
    private var superCars: [SuperCar] = []
}


extension Diller: DillerProtocol {
    
    func addSedan(_ car: Sedan) {
        sedanCars.append(car)
    }
    
    func addMinivan(_ car: Minivan) {
        minivanCars.append(car)
    }
    
    func addPickup(_ car: PickUp) {
        pickupCars.append(car)
    }
    
    func addSportcar(_ car: SportCar) {
        sportCars.append(car)
    }
    
    func addSupercar(_ car: SuperCar) {
        superCars.append(car)
    }
    
    func getCars() -> [CarProtocol] {
        let carList: [CarProtocol] = sedanCars + minivanCars + pickupCars + sportCars + superCars
        sedanCars.removeAll()
        minivanCars.removeAll()
        pickupCars.removeAll()
        sportCars.removeAll()
        superCars.removeAll()
        return carList
    }
}
