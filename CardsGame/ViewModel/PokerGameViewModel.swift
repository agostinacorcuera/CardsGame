//
//  GameViewModel.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 26/11/2024.
//

import Foundation

final class PokerGameViewModel: ObservableObject {
    enum GamePhase {
        case idle, deal, preFlopBet, revealFlop, flopBet, revealTurn, turnBet, revealRiver, riverBet, showDown
    }
    
    @Published var playerCards: [Card] = []
    @Published var cpuCards: [Card] = []
    @Published var communityCards: [Card] = []
    @Published var visibleCommunityCards: [Card] = [] // Cartas visibles progresivamente
    @Published var roundResult: String? = nil
    @Published var playerCash: Int = 10000
    @Published var cpuCash: Int = 10000 // Dinero inicial del CPU
    @Published var showCpuCards: Bool = false
    @Published var currentBet: Int = 0
    @Published var gamePhase: GamePhase = .idle

    private let betStep = 100 // Incremento mínimo de la apuesta
    private var playerTotalBet: Int = 0
    private var cpuTotalBet: Int = 0
    
    func getCard() -> Card {
        let card = Card.random()
        if playerCards.contains(card) || cpuCards.contains(card) || communityCards.contains(card) {
            return getCard()
        }
        return card
    }
    
    func isCommunityCardVisible(_ card: Card) -> Bool {
        return visibleCommunityCards.contains(where: { $0.id == card.id })
    }

    func dealRound() {
        guard gamePhase == .idle, playerCash >= betStep, cpuCash >= betStep else {
            roundResult = determineFinalWinner()
            return
        }

        // Repartir cartas iniciales
        playerCards = [getCard(), getCard()]
        cpuCards = [getCard(), getCard()]
        
        communityCards = (1...5).map { _ in getCard() }
        visibleCommunityCards = []
        
        currentBet = 0
        playerTotalBet = 0
        cpuTotalBet = 0
        showCpuCards = false
        roundResult = nil
        gamePhase = .preFlopBet
    }

    func placeBet(amount: Int) {
        guard playerCash >= amount else {
            roundResult = "Not enough cash!"
            return
        }

        // Apuesta del jugador
        playerCash -= amount
        currentBet += amount
        playerTotalBet += amount

        // CPU iguala la apuesta automáticamente
        cpuMatchBet(amount: amount)
    }

    private func cpuMatchBet(amount: Int) {
        let cpuBet = min(amount, cpuCash) // Apuesta el máximo que puede igualar
        cpuCash -= cpuBet
        currentBet += cpuBet
        cpuTotalBet += cpuBet

        // Verificar si el CPU se quedó sin dinero
        if cpuCash <= 0 {
            roundResult = determineFinalWinner()
            gamePhase = .idle
        }
    }
    
    func nextPhase() {
        guard currentBet > 0 || gamePhase == .showDown else { return }

        switch gamePhase {
        case .preFlopBet:
            revealCommunityCards(count: 3) // Revelar las primeras 3 cartas
            gamePhase = .flopBet
        case .flopBet:
            revealCommunityCards(count: 4) // Revelar la 4ta carta
            gamePhase = .turnBet
        case .turnBet:
            revealCommunityCards(count: 5) // Revelar la 5ta carta
            gamePhase = .riverBet
        case .riverBet:
            evaluateWinner()
            gamePhase = .showDown
        default:
            break
        }
    }

    private func revealCommunityCards(count: Int) {
        visibleCommunityCards = Array(communityCards.prefix(count))
    }

    private func evaluateWinner() {
        let playerValue = calculateHandValue(cards: playerCards + communityCards)
        let cpuValue = calculateHandValue(cards: cpuCards + communityCards)
        if playerValue > cpuValue {
            roundResult = "Player Wins the Hand!"
            playerCash += playerTotalBet + cpuTotalBet
        } else if playerValue < cpuValue {
            roundResult = "CPU Wins the Hand!"
            cpuCash += playerTotalBet + cpuTotalBet
        } else {
            roundResult = "It's a Draw!"
            playerCash += playerTotalBet // Devolver al jugador lo apostado
            cpuCash += cpuTotalBet // Devolver al CPU lo apostado
        }

        currentBet = 0
        showCpuCards = true

        // Verificar si alguno quedó sin dinero
        if playerCash <= 0 || cpuCash <= 0 {
            roundResult = determineFinalWinner()
            gamePhase = .idle
        }
    }
    
    private func calculateHandValue(cards: [Card]) -> Int {
        cards.map {
            switch $0 {
            case .standard(let value, _): return value
            case .joker: return 15
            }
        }.reduce(0, +)
    }
    
    func resetGame() {
        playerCards = []
        cpuCards = []
        communityCards = []
        visibleCommunityCards = []
        currentBet = 0
        playerTotalBet = 0
        cpuTotalBet = 0
        showCpuCards = false
        roundResult = nil
        gamePhase = .idle
    }

    private func determineFinalWinner() -> String {
        if playerCash <= 0 {
            return "CPU Wins the Game!"
        } else if cpuCash <= 0 {
            return "Player Wins the Game!"
        }
        return ""
    }
}

