//
//  Card.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 26/11/2024.
//

import SwiftUI

enum Suit: String, CaseIterable {
    case spades = "spades"
    case hearts = "hearts"
    case diamonds = "diamonds"
    case clubs = "clubs"
}

enum Card: Identifiable, Equatable {
    case standard(value: Int, suit: Suit) // 1-13 corresponden a A, 2-10, J, Q, K
    case joker(color: JokerColor)        // Joker rojo o negro
    
    var id: String { imageName } // Identificador único para usar en listas
    
    var imageName: String {
        switch self {
        case .standard(let value, let suit):
            // Mapear valores a nombres legibles (por ejemplo, card-A-spades)
            let cardValue: String
            switch value {
            case 11: cardValue = "J" // Jack
            case 12: cardValue = "Q" // Queen
            case 13: cardValue = "K" // King
            case 14: cardValue = "A" // As
            default: cardValue = "\(value)"
            }
            return "\(suit.rawValue)-\(cardValue)"
        case .joker(let color):
            return "card-joker-\(color.rawValue)"
        }
    }
    
    static let cardBack = "card-back" // Reverso de la carta
}

enum JokerColor: String {
    case red = "red"
    case black = "black"
}

// Generación de mazo completo
extension Card {
    static func fullDeck(includeJokers: Bool = true) -> [Card] {
        var deck: [Card] = []
        
        // Agregar las 52 cartas estándar
        for suit in Suit.allCases {
            for value in 2...14 {
                deck.append(.standard(value: value, suit: suit))
            }
        }
        
        // Agregar los jokers si es necesario
        if includeJokers {
            deck.append(.joker(color: .red))
            deck.append(.joker(color: .black))
        }
        
        return deck
    }
}

extension Card {
    static func random(includeJokers: Bool = false) -> Card {
        let deck = fullDeck(includeJokers: includeJokers)
        return deck.randomElement()!
    }
}
