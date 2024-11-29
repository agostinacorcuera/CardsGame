//
//  CardView.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 26/11/2024.
//

import SwiftUI

struct CardView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 70, height: 100)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}
