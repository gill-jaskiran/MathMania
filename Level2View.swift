//
//  Level2View.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//

import SwiftUI

struct Level2View: View {
    @ObservedObject var gameManager: GameManager
    @Binding var username: String
    
    var body: some View {
        VStack {
            TextField("Enter your answer", text: $username)
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                if let answer = Int(username) {
                    gameManager.checkAnswer(answer: answer)
                    username = ""
                }
            }) {
                Text("Submit Answer")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct Level2View_Previews: PreviewProvider {
    static var previews: some View {
        Level2View(gameManager: GameManager(), username: .constant(""))
    }
}
