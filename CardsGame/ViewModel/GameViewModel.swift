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
        
        // The result is deleted after 2 seconds
        //TODO: SMALL BUG DELETING RESULT WHEN PRESSING BUTTON SEVERAL TIMES IN A ROW. TO BE FIXED
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.roundResult = nil
        }
    }
}
