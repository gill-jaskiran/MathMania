//
//  Level2View.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//

import SwiftUI

struct Level2View: View {
    @ObservedObject var gameManager: GameManager
    @State private var userInput: String = ""
    
    var body: some View {
        VStack {
            Text("Enter the answer: ")
                .font(.title2)
                .padding(.bottom, 10)
                
            
            TextField("Type your answer here", text: $userInput)
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            Button(action: {
                if let answer = Int(userInput) {
                    gameManager.checkAnswer(answer: answer)
                    userInput = ""
                } else {
                    print("Invalid input. Please enter a valid number.")
                }
            }) {
                Text("Submit Answer")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
        }
    }
}

struct Level2View_Previews: PreviewProvider {
    static var previews: some View {
        Level2View(gameManager: GameManager())
    }
}
