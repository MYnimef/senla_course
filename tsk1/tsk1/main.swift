//
//  main.swift
//  tsk1
//
//  Created by Ivan Markov on 21.02.2022.
//

import Foundation

//Функция, возвращающая корни квадратного уравнения
func solveQuadratic(_ a: Double, _ b: Double, _ c: Double) -> [Double] {
    let D: Double = pow(b, 2) - 4 * a * c
    
    if D < 0 {
        return []
    }
    
    let a2: Double = 2 * a
    
    if D > 0 {
        let sqrtD: Double = sqrt(D)
        return [(-b + sqrtD / a2), (-b - sqrtD) / a2]
    } else {
        return [-b / a2]
    }
}

//Функция, решающая уравнение 3-ей степени
func solveQubic(_ d: Double, _ ap: Double, _ bp: Double, _ cp: Double) -> [Double] {
    let a: Double = ap / d
    let b: Double = bp / d
    let c: Double = cp / d
    
    let Q: Double = (pow(a, 2) - 3 * b) / 9
    let R: Double = (2 * pow(a, 3) - 9 * a * b + 27 * c) / 54
    
    let S: Double = pow(Q, 3) - pow(R, 2)
    if S > 0 {
        let phi = acos(R / pow(Q, 3/2)) / 3
        let arg1 = -2 * sqrt(Q)
        let arg2 = a / 3
        
        return [
            arg1 * cos(phi) - arg2,
            arg1 * cos(phi + 2 * Double.pi / 3) - arg2,
            arg1 * cos(phi - 2 * Double.pi / 3) - arg2
        ]
    } else if S == 0 {
        let arg1: Double = pow(R, 1/3)
        let arg2 = a / 3
        
        let x1 = -2 * arg1 - arg2
        let x23 = arg1 - arg2
        
        return [x1, x23, x23]
    } else {
        return []
    }
}

//Функция, добавляющая в массив новое число Фибоначчи
func addFibonacci(_ arr: inout [Int]) {
    let n: Double = Double(arr.count)
    let phi: Double = (1 + sqrt(5)) / 2
    
    let arg1: Double = pow(phi, n) - pow(-phi, -n)
    let arg2: Double = 2 * phi - 1
    
    arr.append(Int(arg1 / arg2))
}

//Функция, добавляющая в массив n чисел Фибоначчи
func addFibonacci(_ arr: inout [Int], _ n: Int) {
    for _ in 0 ..< n {
        addFibonacci(&arr)
    }
}

//Заполнить n-массив элементов различными простыми числами (метод Эратосфена)
func eratosthenes(_ n: Int) -> [Int] {
    var arr = [Int] (0...n)
    arr[1] = 0
    
    for i in 2 ... n where arr[i] != 0 {
        var j = i * 2
        while j <= n {
            arr[j] = 0
            j += i
        }
    }
    
    var set: Set<Int> = Set(arr)
    set.remove(0)
    return set.sorted()
}
