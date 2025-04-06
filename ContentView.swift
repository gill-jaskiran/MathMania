//
//  ContentView.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var gameManager = GameManager()
    @ObservedObject var recentScores = RecentScores()
    
    var body: some View {
        NavigationStack {
            VStack {
                if gameManager.gameOver {
                    GameOverView(gameManager: gameManager, recentScores: RecentScores())
                } else {
                    LevelView(gameManager: gameManager)
                }
            }
            .navigationTitle("Math Mania")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
