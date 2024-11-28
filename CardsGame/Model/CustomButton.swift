//
//  CustomButton.swift
//  CardsGame
//
//  Created by Agostina Corcuera on 27/11/2024.
//
import SwiftUI

struct CustomButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.horizontal, 40)
    }
}
