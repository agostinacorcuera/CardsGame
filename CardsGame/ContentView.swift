//
//  ContentView.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 25/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card-" + String(Int.random(in: 2...14))
    @State private var cpuCard = "card-" + String(Int.random(in: 2...14))
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        
        ZStack {
            
            Color(red: 0.1, green: 0.5, blue: 0.1)
                .ignoresSafeArea()
            
            VStack() {
                Text("Cards")
                    .font(.largeTitle)
                    .bold(true)
                
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                        .resizable()
                        .cornerRadius(15)
                        .frame(width: 150, height: 280)
                    Spacer()
                    Image(cpuCard)
                        .resizable()
                        .cornerRadius(15)
                        .frame(width: 150, height: 280)
                    Spacer()
                }
                .padding(20)
                
                Spacer()
                Button {
                
                    let playerRard = Int.random(in: 2...14)
                    let cpuRard = Int.random(in: 2...14)
                    
                    playerCard = "card-" + String(playerRard)
                    cpuCard = "card-" + String(cpuRard)
                    
                    if playerRard > cpuRard {
                        playerScore += 1
                    } else if playerRard < cpuRard  {
                        cpuScore += 1
                    }
                    
                } label: {
                    Text("Deal")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(10)
                }
                .buttonStyle(.borderedProminent)
                .tint(.cyan)
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.title2)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.title2)
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
