//
//  LevelView.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//

import SwiftUI

struct LevelView: View {
    @ObservedObject var gameManager: GameManager
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            Text("Level \(gameManager.currentLevel)")
                .font(.largeTitle)
                .padding()
            
            Text(gameManager.question)
                .font(.title2)
                .padding()
            
            // Level 1
            if gameManager.currentLevel == 1 {
                Level1View(gameManager: gameManager)
            }
            // Level 2
            else if gameManager.currentLevel == 2 {
                Level2View(gameManager: gameManager, username: $username)
            }
            
            // Level 3
            else if gameManager.currentLevel == 3 {
                Level3View(gameManager: gameManager)
            }
            
            Text("Score: \(gameManager.score)")
                .font(.title)
                .padding()
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(gameManager: GameManager())
    }
}

