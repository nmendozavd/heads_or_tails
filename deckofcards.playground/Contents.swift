//: Playground - noun: a place where people can play

import UIKit

struct Card {
    var color: String
    var roll: Int
    init(color: String) {
        self.color = color
        var roll = 0
        
        if color == "blue" {
            roll = Int(arc4random_uniform(2) + 1)
        } else if color == "red" {
            roll = Int(arc4random_uniform(2) + 3)
        } else if color == "green" {
            roll = Int(arc4random_uniform(3) + 4)
        }
        self.roll = roll
    }
}

class Deck {
    var cards = [Card]()
    init() {
        let colors = ["blue", "red", "green"]
        for color in colors {
            for _ in 0...9 {
                self.cards.append(Card(color: color))
            }
        }
        
    }
    
    func deal() -> Card {
        return self.cards.popLast()!
    }
    

    func isEmpty() -> Bool {
        return self.cards.count > 0 ? false : true
    }
    
    func shuffle() {
        for _ in 0...1000{
            let randOne = Int(arc4random_uniform(UInt32(self.cards.count)))
            let randTwo = Int(arc4random_uniform(UInt32(self.cards.count)))
            let temp = self.cards[randOne]
            self.cards[randOne] = self.cards[randTwo]
            self.cards[randTwo] = temp
        }

    }
}
class Player {
    var name: String
    var hand = [Card]()
    init(_ name: String){
        self.name = name
    }
    
    func draw(deck: Deck) -> Card {
        let drawnCard = deck.deal()
        self.hand.append(drawnCard)
        return drawnCard
    }
    func rollDice() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
    func matchingCards(color: String, roll: Int) -> Int {
        var match = 0
        for card in self.hand {
            if card.color == color && card.roll == roll {
                match += 1
            }
        }
        return match
    }
    
}


