//
//  ContentView.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 25/11/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.5, blue: 0.1)
                .ignoresSafeArea()
            
            VStack {
                Image("mini-poker-logo")
                    .resizable()
                    .frame(width: 150, height: 80)
                
                Spacer()
                
                HStack {
                    ScoreView(title: "Player", score: viewModel.playerScore)
                        .padding(.trailing, 30)
                        .foregroundColor(.white)
                    ScoreView(title: "CPU", score: viewModel.cpuScore)
                        .padding(.leading, 30)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack(spacing: 15) {
                    CardView(imageName: viewModel.playerCard.rawValue)
                    CardView(imageName: viewModel.cpuCard.rawValue)
                }
                .padding(.bottom, 20)
                
                Spacer()
                
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
                
                Spacer()
                
                ZStack {
                    Text(viewModel.roundResult ?? " ")
                        .font(.title3)
                        .foregroundColor(.yellow)
                        .padding(.bottom, 20)
                }
                .frame(height: 30)
                
                CustomButton(title: "Deal", color: .cyan) {
                    viewModel.dealCards()
                }
                
                Spacer()

                HStack {
                    Text("💰 Cash: $\(viewModel.playerCash)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
