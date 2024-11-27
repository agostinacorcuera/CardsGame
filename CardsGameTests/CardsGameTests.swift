//
//  CardsGameTests.swift
//  CardsGameTests
//
//  Created by Agostina Corcuera on 25/11/2024.
//

import XCTest
@testable import CardsGame

final class GameViewModelTests: XCTestCase {

    var viewModel: GameViewModel!
    
    override func setUpWithError() throws {
        // Inicializa el ViewModel antes de cada test
        viewModel = GameViewModel()
    }
    
    override func tearDownWithError() throws {
        // Limpia después de cada test
        viewModel = nil
    }
    
    func testInitialState() throws {
        // Verifica que el estado inicial sea correcto
        XCTAssertEqual(viewModel.playerScore, 0, "Player score should start at 0")
        XCTAssertEqual(viewModel.cpuScore, 0, "CPU score should start at 0")
        XCTAssertNotNil(viewModel.playerCard, "Player card should not be nil")
        XCTAssertNotNil(viewModel.cpuCard, "CPU card should not be nil")
    }
    
    func testDealCardsUpdatesCards() throws {
        // Guarda las cartas actuales
        let initialPlayerCard = viewModel.playerCard
        let initialCpuCard = viewModel.cpuCard
        
        // Llama al método dealCards
        viewModel.dealCards()
        
        // Asegúrate de que las cartas cambien
        XCTAssertNotEqual(viewModel.playerCard, initialPlayerCard, "Player card should change after dealing")
        XCTAssertNotEqual(viewModel.cpuCard, initialCpuCard, "CPU card should change after dealing")
    }
    
    func testDealCardsUpdatesScores() throws {
        // Establece valores iniciales para las cartas
        viewModel.playerCard = .card13
        viewModel.cpuCard = .card12
        
        // Llama al método dealCards
        viewModel.dealCards()
        
        // Simula que la carta del jugador gana
        if viewModel.playerCard.rawValue > viewModel.cpuCard.rawValue {
            XCTAssertGreaterThan(viewModel.playerScore, 0, "Player score should increase if player wins")
        } else if viewModel.playerCard.rawValue < viewModel.cpuCard.rawValue {
            XCTAssertGreaterThan(viewModel.cpuScore, 0, "CPU score should increase if CPU wins")
        } else {
            XCTAssertEqual(viewModel.playerScore, 0, "Scores should remain unchanged if there's a tie")
            XCTAssertEqual(viewModel.cpuScore, 0, "Scores should remain unchanged if there's a tie")
        }
    }
    
    func testRoundResult() throws {
        viewModel.playerCard = .card14
        viewModel.cpuCard = .card13

        viewModel.updateRoundResult()

        XCTAssertNotNil(viewModel.roundResult, "roundResult should not be nil")
        XCTAssertEqual(viewModel.roundResult, "Player Wins!", "Result should be 'Player Wins!' if the player has a higher card")

        viewModel.playerCard = .card12
        viewModel.cpuCard = .card13

        viewModel.updateRoundResult()

        XCTAssertNotNil(viewModel.roundResult, "roundResult should not be nil")
        XCTAssertEqual(viewModel.roundResult, "CPU Wins!", "Result should be 'CPU Wins!' if the CPU has a higher card")
    }

}

