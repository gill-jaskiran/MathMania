//
//  Leaderboard.swift
//  MathMania
//
//  Created by Elizabeth Thomas on 2025-02-17.
//
import Foundation

class Leaderboard: ObservableObject {
    @Published var items: [LeaderboardItem] = []
    
    init(items: [LeaderboardItem] = []) {
        self.items = items
    }    
          
    func addScore(username: String, score: Int) {
        let newItem = LeaderboardItem(username: username, score: score)
        leaderboard.append(newItem)
        leaderboard.sort { $0.score>$1.score }    
    }
}