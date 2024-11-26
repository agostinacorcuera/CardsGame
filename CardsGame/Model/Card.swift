//
//  Card.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 26/11/2024.
//

enum Card: String, CaseIterable {
    case card2 = "card-2", card3 = "card-3", card4 = "card-4", card5 = "card-5"
    case card6 = "card-6", card7 = "card-7", card8 = "card-8", card9 = "card-9"
    case card10 = "card-10", card11 = "card-11", card12 = "card-12"
    case card13 = "card-13", card14 = "card-14"
    
    var value: Int {
        Int(rawValue.split(separator: "-")[1]) ?? 0
    }
    
    static func random() -> Card {
        Card.allCases.randomElement()!
    }
}

