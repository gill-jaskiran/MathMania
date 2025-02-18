//
//  ContentView.swift
//  MathMania
//
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameManager = GameManager()
    @ObservedObject var leaderboard = Leaderboard()
    @State private var username: String = ""

    var body: some View {
        VStack {
            if gameManager.gameOver {
                Text("Game Over!")
                    .font(.largeTitle)
                    .padding()

                Text("Final Score: \(gameManager.score)")
                    .font(.title)
                    .padding()

                TextField("Enter your name", text: $username)

                Button(action: {
                    leaderboard.addScore(username: username.isEmpty ? "Anonymous" : username, score: gameManager.score)
                }) {
                    Text("Submit Score")
                        
                }

                Text("Top 7 Leaderboard:")

                List(leaderboard.leaderboard) { item in
                    HStack {
                        Text(item.username)
                        Spacer()
                        Text("\(item.score) points")
                    }
                }

                Button(action: {
                    gameManager.resetGame()
                    username = ""
                }) {
                    Text("Play Again")
                     
                }
            } else {
                Text("Level \(gameManager.currentLevel)")
                Text(gameManager.question)

                if gameManager.currentLevel == 1 {
                    HStack {
                        Button(action: { gameManager.checkGuess(guess: "Odd") }) {
                            Text("Odd")
                        }
                        Button(action: { gameManager.checkGuess(guess: "Even") }) {
                        }
                        .padding()
                    }
                } else {
                    TextField("Enter your answer", text: $username)

                    Button(action: {
                        if let answer = Int(username) {
                            gameManager.checkAnswer(answer: answer)
                            username = ""
                        }
                    }) {
                        Text("Submit Answer")
                    }

                }

                Text("Score: \(gameManager.score)")
            }
        }
    }
}


#Preview {
    ContentView()
}

