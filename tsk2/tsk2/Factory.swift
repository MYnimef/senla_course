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
    
    weak var delegate: FactoryDelegate?
    
    let factoryName: String
    
    init(factoryName: String) {
        self.factoryName = factoryName
    }
    
    func makeMercedes() {
        var car = Sedan(
            modelName: "Mercedes",
            physicalSpecs: PhysicalCpecs(weight: 1500, width: 1816, length: 4351, height: 1816),
            engine: Engine(name: "WRUM", maxSpeed: 120, velocity: 80),
            gunsAmount: 5
        )
        
        assemble(&car)
        
        sedanCars.append(car)
        if let dillerDelegate = delegate {
            dillerDelegate.factoryDidCreate(self, sedanCars)
            sedanCars.removeAll()
        }
    }
    
    func makeHondaOdyssey() {
        var car = Minivan(
            modelName: "Honda odyssey",
            physicalSpecs: PhysicalCpecs(weight: 15000, width: 18160, length: 43510, height: 18160),
            engine: Engine(name: "FURICH", maxSpeed: 100, velocity: 70)
        )
        
        assemble(&car)
        
        minivanCars.append(car)
        if let dillerDelegate = delegate {
            dillerDelegate.factoryDidCreate(self, minivanCars)
            minivanCars.removeAll()
        }
    }
    
    func makeTomcat() {
        var car = PickUp(
            modelName: "Tomcat",
            physicalSpecs: PhysicalCpecs(weight: 15000, width: 18160, length: 43510, height: 18160),
            engine: Engine(name: "FURICH", maxSpeed: 100, velocity: 70)
        )
        
        assemble(&car)
        
        pickupCars.append(car)
        if let dillerDelegate = delegate {
            dillerDelegate.factoryDidCreate(self, pickupCars)
            pickupCars.removeAll()
        }
    }
    
    func makeAudiS3() {
        var car = SportCar(
            modelName: "Audi S3 Sportback",
            physicalSpecs: PhysicalCpecs(weight: 1500, width: 1816, length: 4351, height: 1816),
            engine: Engine(name: "TFSI", maxSpeed: 150, velocity: 90)
        )
        
        assemble(&car)
        
        sportCars.append(car)
        if let dillerDelegate = delegate {
            dillerDelegate.factoryDidCreate(self, sportCars)
            sportCars.removeAll()
        }
    }
    
    func makeBMWX5() {
        var car = SuperCar(
            modelName: "BMW X5",
            physicalSpecs: PhysicalCpecs(weight: 1550, width: 1806, length: 4651, height: 1916),
            engine: Engine(name: "XXXI", maxSpeed: 200, velocity: 100)
        )
        
        assemble(&car)
        
        superCars.append(car)
        if let dillerDelegate = delegate {
            dillerDelegate.factoryDidCreate(self, superCars)
            superCars.removeAll()
        }
    }
    
    private func assemble<T: CarProtocol>(_ car: inout T) {
        car.assemble()
        Factory.madeCars += 1
    }
}


protocol FactoryDelegate: AnyObject {
    
    func factoryDidCreate(_ factory: Factory, _ cars: [Sedan])
    func factoryDidCreate(_ factory: Factory, _ cars: [Minivan])
    func factoryDidCreate(_ factory: Factory, _ cars: [PickUp])
    func factoryDidCreate(_ factory: Factory, _ cars: [SportCar])
    func factoryDidCreate(_ factory: Factory, _ cars: [SuperCar])
}


class Diller {
    
    private var sedanCars: [Sedan] = []
    private var minivanCars: [Minivan] = []
    private var pickupCars: [PickUp] = []
    private var sportCars: [SportCar] = []
    private var superCars: [SuperCar] = []
    
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


extension Diller: FactoryDelegate {
    
    func factoryDidCreate(_ factory: Factory, _ cars: [Sedan]) {
        cars.forEach({ car in
            var dillerCar = car
            dillerCar.factoryName = factory.factoryName
            sedanCars.append(dillerCar)
        })
    }
    
    func factoryDidCreate(_ factory: Factory, _ cars: [Minivan]) {
        cars.forEach({ car in
            var dillerCar = car
            dillerCar.factoryName = factory.factoryName
            minivanCars.append(dillerCar)
        })
    }
    
    func factoryDidCreate(_ factory: Factory, _ cars: [PickUp]) {
        cars.forEach({ car in
            var dillerCar = car
            dillerCar.factoryName = factory.factoryName
            pickupCars.append(dillerCar)
        })
    }
    
    func factoryDidCreate(_ factory: Factory, _ cars: [SportCar]) {
        cars.forEach({ car in
            var dillerCar = car
            dillerCar.factoryName = factory.factoryName
            sportCars.append(dillerCar)
        })
    }
    
    func factoryDidCreate(_ factory: Factory, _ cars: [SuperCar]) {
        cars.forEach({ car in
            var dillerCar = car
            dillerCar.factoryName = factory.factoryName
            superCars.append(dillerCar)
        })
    }
}
