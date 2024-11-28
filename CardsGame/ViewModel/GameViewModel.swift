//
//  GameViewModel.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 26/11/2024.
//

import Foundation

final class GameViewModel: ObservableObject {
    @Published var playerCard: Card = Card.random()
    @Published var cpuCard: Card = Card.random()
    @Published var playerScore: Int = 0
    @Published var cpuScore: Int = 0
    @Published var roundResult: String? = nil
    @Published var playerCash: Int = 1000 // Valor inicial del dinero
    
    func dealCards() {
        playerCard = Card.random()
        cpuCard = Card.random()
        
        if playerCard.value > cpuCard.value {
            playerScore += 1
            roundResult = "Player Wins!"
        } else if playerCard.value < cpuCard.value {
            cpuScore += 1
            roundResult = "CPU Wins!"
        } else {
            roundResult = "It's a Draw!"
        }
        
        // Ocultar el resultado después de 2 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.roundResult = nil
        }
    }
    
    func placeBet(amount: Int) {
        guard amount <= playerCash else {
            roundResult = "Not enough cash to place the bet!"
            return
        }
        playerCash -= amount
    }
    
    func awardWinnings(amount: Int) {
        playerCash += amount
    }
}
