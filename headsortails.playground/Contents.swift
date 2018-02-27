//: Playground - noun: a place where people can play

import UIKit

func tossCoin() -> String {
    print("Tossing a Coin!")
    let toss = Int(arc4random_uniform(2))
    var result: String = String()
    if toss == 0 {
        result = "Heads"
    } else {
        result = "Tails"
    }
    print(result)
    return result
}


func tossMultipleCoins(num: Int) -> Double {
    var heads: Int = Int()
    for _ in 1...num {
        if tossCoin() == "Heads" {
            heads += 1
        }
    }
    return Double(heads)/Double(num)
}
print(tossMultipleCoins(num: 10))

