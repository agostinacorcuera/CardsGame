//
//  Coin.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 28/11/2024.
//

import SwiftUI

struct CoinView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
    }
    
}
