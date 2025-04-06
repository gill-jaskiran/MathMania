//
//  Persistence.swift
//  MathMania
//
//  Created by Elizabeth Thomas on 2025-04-05.
//


import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MathMania")
        
        container.loadPersistentStores{ description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }
}
