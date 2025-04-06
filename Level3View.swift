//
//  Level3View.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//

import SwiftUI

struct Level3View: View {
    @ObservedObject var gameManager: GameManager
    
    var body: some View {
        VStack {
            Button(action: { gameManager.checkPrimeGuess(guess: "Yes Prime") }) {
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.white)
                    Text("Prime")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(width: 180, height: 60)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), startPoint: .leading, endPoint: .trailing)
                )
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
            }
            .padding()

            Button(action: { gameManager.checkPrimeGuess(guess: "Not Prime") }) {
                HStack {
                    Image(systemName: "xmark.octagon.fill")
                        .foregroundColor(.white)
                    Text("Not Prime")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(width: 180, height: 60)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .leading, endPoint: .trailing)
                )
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
            }
            .padding()
        }
        .padding(.top, 20)
    }
}

struct Level3View_Previews: PreviewProvider {
    static var previews: some View {
        Level3View(gameManager: GameManager())
    }
}
