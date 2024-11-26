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
                Text("A Cards Game")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                
                Spacer()
                
                HStack(spacing: 40) {
                    CardView(imageName: viewModel.playerCard.rawValue)
                    CardView(imageName: viewModel.cpuCard.rawValue)
                }
                
                Spacer()
                
                if let result = viewModel.roundResult {
                    Text(result)
                        .font(.headline)
                        .foregroundColor(.yellow)
                        .transition(.opacity)
                        .padding(.bottom, 10)
                }
                
                Button("Deal") {
                    viewModel.dealCards()
                }
                .font(.headline)
                .padding()
                .background(Color.cyan)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
                
                HStack {
                    ScoreView(title: "Player", score: viewModel.playerScore)
                        .padding(.trailing, 30)
                    ScoreView(title: "CPU", score: viewModel.cpuScore)
                        .padding(.leading, 30)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
