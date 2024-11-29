//
//  ContentView.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 25/11/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PokerGameViewModel()

    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()

            VStack {
                // Logo
                Image("mini-poker-logo")
                    .resizable()
                    .frame(width: 180, height: 90)
                    .padding(.top, 10)

                Spacer()

                // CPU cards (fixed space)
                HStack(spacing: 10) {
                    ForEach(0..<2, id: \.self) { index in
                        ZStack {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: 70, height: 100) // Fixed space
                            if viewModel.cpuCards.indices.contains(index) {
                                Image(viewModel.showCpuCards ? viewModel.cpuCards[index].imageName : Card.cardBack)
                                    .resizable()
                                    .frame(width: 70, height: 100)
                            }
                        }
                    }
                }

                Spacer()

                // Community cards (fixed space for 5 cards)
                HStack(spacing: 10) {
                    ForEach(0..<5, id: \.self) { index in
                        ZStack {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: 70, height: 100) // Fixed space
                            if viewModel.communityCards.indices.contains(index) {
                                Image(viewModel.isCommunityCardVisible(viewModel.communityCards[index]) ? viewModel.communityCards[index].imageName : Card.cardBack)
                                    .resizable()
                                    .frame(width: 70, height: 100)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)

                Spacer()

                // Player cards (fixed space)
                HStack(spacing: 10) {
                    ForEach(0..<2, id: \.self) { index in
                        ZStack {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: 70, height: 100) // Fixed space
                            if viewModel.playerCards.indices.contains(index) {
                                Image(viewModel.playerCards[index].imageName)
                                    .resizable()
                                    .frame(width: 70, height: 100)
                            }
                        }
                    }
                }

                Spacer()

                // Bet options
                HStack {
                    CoinButtonView(imageName: "100-COIN") {
                        viewModel.placeBet(amount: 100)
                    }
                    CoinButtonView(imageName: "500-COIN") {
                        viewModel.placeBet(amount: 500)
                    }
                    CoinButtonView(imageName: "1000-COIN") {
                        viewModel.placeBet(amount: 1000)
                    }
                }
                .padding(.vertical, 10)

                Spacer()

                // Cash and action button
                VStack(alignment: .leading) {
                    // Bet and Cash Info
                    HStack {
                        Text("🎲 Bet: \(viewModel.currentBet)")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    HStack {
                        Text("💰 Cash: $\(viewModel.playerCash)")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                    
                    if let result = viewModel.roundResult {
                        Text(result)
                            .font(.headline)
                            .foregroundColor(.yellow)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                    }
                    
                    // Dynamic Button
                    CustomButton(
                        title: viewModel.gamePhase == .idle ? "Start" :
                               viewModel.gamePhase == .showDown ? "Restart" : "Continue",
                        color: .blue
                    ) {
                        if viewModel.gamePhase == .idle {
                            viewModel.dealRound()
                        } else if viewModel.gamePhase == .showDown {
                            viewModel.resetGame()
                        } else {
                            viewModel.nextPhase()
                        }
                    }
                    .disabled(viewModel.gamePhase == .idle && viewModel.currentBet > 0)
                }
                .padding(.horizontal, 50)
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
