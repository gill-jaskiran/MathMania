//
//  GameOverView.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//  Edited by Elizabeth Thomas on 2025-04-04
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var gameManager: GameManager
    @ObservedObject var recentScores: RecentScores
    
    @State private var playerName: String = ""
    @State private var scoreSubmitted = false


    var body: some View {
        VStack {
            Text("Game Over!")
                .font(.title2)
                .padding(5)
            
            Text("Your Score: \(gameManager.score)")
                .font(.title2)
                .padding(5)
            
            TextField("Enter your name", text: $playerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .padding(5)
            
            Button(action: {
                guard !playerName.isEmpty else {
                    print("Player name cannot be empty!")
                    return
                }
                recentScores.addScore(username: playerName, score: gameManager.score)
                scoreSubmitted = true
            })
            {
                Text(scoreSubmitted ? "Submitted": "Submit")
                    .background(scoreSubmitted ? Color.gray : Color.green)
                    .padding(5)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            Text("Recent Scores:")
                .font(.title2)
            
            
            List(recentScores.recentScores) { item in
                HStack {
                    Text("\(item.username)")
                        .font(.headline)
                    Spacer()
                    
                    Text("\(item.score) points")
                        .font(.headline)
                    Spacer()
                    
                    Text(item.timestamp, style: .date)
                    .font(.caption)                }
            }
            HStack(spacing: 20) {
                NavigationLink(destination: ContentView()) {
                    Text("Play Again")
                        .padding(5)
                        .foregroundColor(.white)
                        .frame(maxWidth: 100)
                        .background(Color.green)            .cornerRadius(5)
                }
                
                
                Button(action: {
                    UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                    exit(0)
                }) {
                    Text("Exit Game")
                        .padding(5)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            
            .padding(.top, 10)
            .navigationTitle("")
        }
            
    }
    
}
