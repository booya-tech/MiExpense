//
//  MiExpenseTrackerApp.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/6/25.
//

import SwiftUI

@main
struct MiExpenseTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
