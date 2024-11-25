//
//  ContentView.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 25/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Color(red: 0.1, green: 0.5, blue: 0.1)
                .ignoresSafeArea()
            
            VStack() {
                
                Image("cardsIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                    .padding(.top, 20)
                
                Spacer()
                HStack {
                    Spacer()
                    Image("card-2")
                        .resizable()
                        .cornerRadius(15)
                        .frame(width: 150, height: 280)
                    Spacer()
                    Image("card-3")
                        .resizable()
                        .cornerRadius(15)
                        .frame(width: 150, height: 280)
                    Spacer()
                }
                .padding(20)
                
                Spacer()
                Button("DEAL") {
                    
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.title2)
                            .padding(.bottom, 10)
                        Text("0")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.title2)
                            .padding(.bottom, 10)
                        Text("0")
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
