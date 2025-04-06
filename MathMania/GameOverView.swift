//
//  GameOverView.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//  Edited by Elizabeth Thomas on 2025-04-05.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var gameManager: GameManager
    @ObservedObject var recentScores: RecentScores
    
    @State private var playerName: String = ""
    @State private var scoreSubmitted = false


    var body: some View {
        VStack (spacing: 15){
            Text("Game Over!")
                .font(.title2)
            
            Text("Your Score: \(gameManager.score)")
                .font(.title2)
            
            TextField("Enter your name", text: $playerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
            
            Button(action: {
                guard !playerName.isEmpty else {
                    print("Player name cannot be empty!")
                    return
                }
                recentScores.addScore(username: playerName, score: gameManager.score)
                scoreSubmitted = true
                
                }) {
                Text(scoreSubmitted ? "Score Submitted" : "Submit Score")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(scoreSubmitted ? Color.gray : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
            }
            
            Text("Recent Scores:")
                .font(.title2)
            
            List(recentScores.recentScores) { item in
                HStack (spacing: 10){
                    Text("\(item.username)")
                        .font(.headline)
                    Spacer()
                    
                    Text("\(item.score) points")
                        .font(.headline)
                    Spacer()
                    
                    Text(item.timestamp, style: .date)
                    .font(.caption)                }
            }
            .padding()
            
            HStack(spacing: 30) {
                NavigationLink(destination: ContentView()) {
                    Text("Play Again")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                    exit(0)
                }) {
                    Text("Exit Game")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.top, 20)
            .navigationTitle("")
        }
            
    }
    
}

