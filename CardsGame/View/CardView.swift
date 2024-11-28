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
            .cornerRadius(10)
            .frame(width: 120, height: 200)
    }
}
