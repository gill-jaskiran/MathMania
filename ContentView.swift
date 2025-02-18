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
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    leaderboard.addScore(username: username.isEmpty ? "Anonymous" : username, score: gameManager.score)
                }) {
                    Text("Submit Score")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Text("Top 7 Leaderboard:")
                    .font(.title2)
                    .padding()

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
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

            } else {
                Text("Level \(gameManager.currentLevel)")
                    .font(.largeTitle)
                    .padding()

                Text(gameManager.question)
                    .font(.title2)
                    .padding()

                if gameManager.currentLevel == 1 {
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
                } else {
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

                Text("Score: \(gameManager.score)")
                    .font(.title)
                    .padding()
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}

