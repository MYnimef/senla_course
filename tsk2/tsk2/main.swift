//
//  main.swift
//  tsk2
//
//  Created by Ivan Markov on 03.03.2022.
//

import Foundation


let factory = Factory()
factory.startMakingAudi()
factory.startMakingMercedes()
factory.startMakingTomcat()
for car in factory.getCarsFromFactory() {
    car.action()
}

