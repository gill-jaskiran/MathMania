//
//  Leaderboard.swift
//  MathMania
//
//  Created by Elizabeth Thomas on 2025-03-20.
//

import Foundation

struct LeaderboardItem: Codable, Identifiable {
    var id = UUID()
    var username: String
    var score: Int
}

class Leaderboard: ObservableObject {
    @Published var leaderboard: [LeaderboardItem] = []
    
    init() {
        loadLeaderboard()
    }
    
    func loadLeaderboard() {
        if let savedData = UserDefaults.standard.data(forKey: "leaderboard") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([LeaderboardItem].self, from: savedData) {
                leaderboard = decodedData
            }
        }
    }
    
    func saveLeaderboard() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(leaderboard) {
            UserDefaults.standard.set(encodedData, forKey: "leaderboard")
        }
    }
        
    /* func addScore(username: String, score: Int) {
        let newItem = LeaderboardItem(username: username, score: score)
        leaderboard.append(newItem)
        leaderboard.sort { $0.score>$1.score }
        
        if leaderboard.count > 7 {
            leaderboard = Array(leaderboard.prefix(7))
        }

    saveLeaderboard()
    } */
    
    func addScore(score: Int){
        let newItem = LeaderboardItem(username: "Current User", score: score)
        leaderboard.insert(newItem, at: 0)
        leaderboard = Array(leaderboard.prefix(10))
        saveLeaderboard()
    }
}
