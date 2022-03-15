//
//  main.swift
//  tsk2
//
//  Created by Ivan Markov on 03.03.2022.
//


let factory = Factory(factoryName: "АВТОВАЗ")
let diller = Diller()
factory.delegate = diller

factory.makeTomcat()
factory.makeBMWX5()
factory.makeAudiS3()
factory.makeMercedes()

diller.getCars().forEach({ car in
    var madeBy: String
    if let factory = car.factoryName {
        madeBy = "made by " + factory
    } else {
        madeBy = ""
    }
    
    print("Car \(car.modelName) \(madeBy) is \(car.state == .working ? "ready" : "not ready")")
})

print(Factory.madeCars)

