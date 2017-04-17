//: Playground - noun: a place where people can play

import UIKit

var states = ["California", "New York", "Texas", "Alaska"]

let abbreviatedStates = states.map({
    (state: String) -> String in
        let index = state.index(state.startIndex, offsetBy: 2)
        return state.substring(to: index).uppercased()
})

print(abbreviatedStates)

let a = states.map {
    state -> String in
    let index = state.index(state.startIndex, offsetBy: 2)
    return state.substring(to: index).uppercased()
}

print(a)

let numbers = [5,2,7,9,8,1,100,22, 53]

let result = numbers.sorted(by: {
    n1, n2 in
    return n1 > n2
})

print(result)

let result2 = numbers.sorted(by: { $0 > $1 })

print(result2)

//

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)

incrementBySeven()
