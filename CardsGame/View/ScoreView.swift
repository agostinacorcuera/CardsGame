//
//  ScoreView.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 26/11/2024.
//

import SwiftUI

struct ScoreView: View {
    let title: String
    let score: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
            Text("\(score)")
                .font(.largeTitle)
        }
    }
}
