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
                } else if gameManager.currentLevel == 2 {
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
                } else if gameManager.currentLevel == 3 {
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

                Text("Score: \(gameManager.score)")
                    .font(.title)
                    .padding()
            }
            if gameManager.gameOver {
                Text("Game Over!")
                    .font(.largeTitle)
                    .padding()

                Text("Final Score: \(gameManager.score)")
                    .font(.title)
                    .padding()

                /* TextField("Enter your name", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle()) */

                Button(action: {
                    leaderboard.addScore(score: gameManager.score)
                }) {
                    Text("Submit Score")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Text("Recent Scores: ")
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
                } else if gameManager.currentLevel == 2 {
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
                } else if gameManager.currentLevel == 3 {
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
