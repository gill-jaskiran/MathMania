//
//  LevelView.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//  Edited by Elizabeth Thomas on 2025-04-05.
//

import SwiftUI

struct LevelView: View {
    @ObservedObject var gameManager: GameManager
        
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
                Level2View(gameManager: gameManager)
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

