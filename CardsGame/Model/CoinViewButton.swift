//
//  CoinViewButton.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 28/11/2024.
//

import SwiftUI

struct CoinButtonView: View {
    let imageName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .shadow(radius: 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
