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
            .cornerRadius(15)
            .frame(width: 150, height: 280)
    }
}
