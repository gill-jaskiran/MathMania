//
//  GameOverView.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var gameManager: GameManager
    @ObservedObject var leaderboard: Leaderboard

    @State private var username: String = ""

    var body: some View {
        VStack {
            Text("Game Over!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Final Score: \(gameManager.score)")
                .font(.title)
                .padding()
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

            Text("Recent Scores:")
                .font(.title2)
                .padding()

            List(leaderboard.leaderboard) { item in
                HStack {
                    Text(item.username)
                    Spacer()
                    Text("\(item.score) points")
                }
            }
            NavigationLink(destination: ContentView()) {
                Text("Play Again")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Leaderboard")
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(gameManager: GameManager(), leaderboard: Leaderboard())
    }
}
