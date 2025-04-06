//
//  MathManiaApp.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//  Edited by Elizabeth Thomas on 2025-04-05.
//

import SwiftUI


@main
struct GameAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
