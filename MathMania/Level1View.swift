//
//  Level3View.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//  Edited by Elizabeth Thomas on 2025-04-05.
//

import SwiftUI

struct Level1View: View {
    @ObservedObject var gameManager: GameManager
    
    var body: some View {
        HStack {
            Button(action: { gameManager.checkGuess(guess: "Odd") }) {
                Text("Odd")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Button(action: { gameManager.checkGuess(guess: "Even") }) {
                Text("Even")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct Level1View_Previews: PreviewProvider {
    static var previews: some View {
        Level1View(gameManager: GameManager())
    }
}

