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
    
    private weak var delegate: DelegateProtocol?
    
    let factoryName: String
    
    init(factoryName: String) {
        self.factoryName = factoryName
    }
    
    func setDelegate(_ delegate: DelegateProtocol) {
        sedanCars.forEach({ car in
            delegate.addSedan(car)
        })
        sedanCars.removeAll()
        minivanCars.forEach({ car in
            delegate.addMinivan(car)
        })
        minivanCars.removeAll()
        pickupCars.forEach({ car in
            delegate.addPickup(car)
        })
        pickupCars.removeAll()
        sportCars.forEach({ car in
            delegate.addSportcar(car)
        })
        sportCars.removeAll()
        superCars.forEach({ car in
            delegate.addSupercar(car)
        })
        superCars.removeAll()
        self.delegate = delegate
    }
    
    func makeMercedes() {
        var car = Sedan(
            modelName: "Mercedes",
            physicalSpecs: PhysicalCpecs(weight: 1500, width: 1816, length: 4351, height: 1816),
            engine: Engine(name: "WRUM", maxSpeed: 120, velocity: 80),
            gunsAmount: 5
        )
        assemble(&car)
        if let dillerDelegate = delegate {
            dillerDelegate.addSedan(car)
        } else {
            sedanCars.append(car)
        }
    }
    
    func makeHondaOdyssey() {
        var car = Minivan(
            modelName: "Honda odyssey",
            physicalSpecs: PhysicalCpecs(weight: 15000, width: 18160, length: 43510, height: 18160),
            engine: Engine(name: "FURICH", maxSpeed: 100, velocity: 70)
        )
        assemble(&car)
        if let dillerDelegate = delegate {
            dillerDelegate.addMinivan(car)
        } else {
            minivanCars.append(car)
        }
    }
    
    func makeTomcat() {
        var car = PickUp(
            modelName: "Tomcat",
            physicalSpecs: PhysicalCpecs(weight: 15000, width: 18160, length: 43510, height: 18160),
            engine: Engine(name: "FURICH", maxSpeed: 100, velocity: 70)
        )
        assemble(&car)
        if let dillerDelegate = delegate {
            dillerDelegate.addPickup(car)
        } else {
            pickupCars.append(car)
        }
    }
    
    func makeAudiS3() {
        var car = SportCar(
            modelName: "Audi S3 Sportback",
            physicalSpecs: PhysicalCpecs(weight: 1500, width: 1816, length: 4351, height: 1816),
            engine: Engine(name: "TFSI", maxSpeed: 150, velocity: 90)
        )
        assemble(&car)
        if let dillerDelegate = delegate {
            dillerDelegate.addSportcar(car)
        } else {
            sportCars.append(car)
        }
    }
    
    func makeBMWX5() {
        var car = SuperCar(
            modelName: "BMW X5",
            physicalSpecs: PhysicalCpecs(weight: 1550, width: 1806, length: 4651, height: 1916),
            engine: Engine(name: "XXXI", maxSpeed: 200, velocity: 100)
        )
        assemble(&car)
        if let dillerDelegate = delegate {
            dillerDelegate.addSupercar(car)
        } else {
            superCars.append(car)
        }
    }
    
    private func assemble<T: CarProtocol>(_ car: inout T) {
        car.assemble()
        car.factoryName = factoryName
        Factory.madeCars += 1
    }
}


protocol DelegateProtocol: AnyObject {
    
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


extension Diller: DelegateProtocol {
    
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
