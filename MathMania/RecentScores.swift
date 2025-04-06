//
//  RecentScores.swift
//  MathMania
//
//  Created by Elizabeth Thomas on 2025-04-05.
//

import Foundation
import CoreData

struct RecentScoreRecord: Identifiable {
    var id: UUID
    var username: String
    var score: Int
    var timestamp: Date
    
}

class RecentScores: ObservableObject {
    private let context = PersistenceController.shared.container.viewContext
    @Published var recentScores: [RecentScoreRecord] = []
    
    let username: String = "PlayerName"
    
    
    init() {
        loadRecentScores()
    }
    
    func loadRecentScores() {
        let fetchRequest = NSFetchRequest<RecentScore>(entityName: "RecentScore")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
        fetchRequest.fetchLimit = 10
        
        do {
            let results = try context.fetch(fetchRequest)
            recentScores = results.map {
                RecentScoreRecord(id: $0.id ?? UUID(), username: $0.username ?? "Annonymous", score: Int($0.score), timestamp: $0.timestamp ?? Date())
            }
        } catch {
                print("Failed to fetch recent scores: \(error.localizedDescription)")
            }
        }
    
    func addScore(username: String, score: Int) {
        let newScore = RecentScore(context: context)
        newScore.id = UUID()
        newScore.username = username
        newScore.score = Int32(score)
        newScore.timestamp = Date()
        
        recentScores.insert(RecentScoreRecord(id: newScore.id ?? UUID(), username: newScore.username ?? "Annonymous", score: Int(newScore.score), timestamp: newScore.timestamp ?? Date()), at: 0)
        recentScores = Array(recentScores.prefix(10))
        saveScores()
    }
    
    func saveScores() {
        do {
            try context.save()
        } catch {
            print("Failed to save scores: \(error.localizedDescription)")
        }
    }
}
