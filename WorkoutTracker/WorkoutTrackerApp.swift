//
//  WorkoutTrackerApp.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import SwiftData
import SwiftUI

@main
struct WorkoutTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    WorkoutSession.self,
                    WorkoutTemplate.self
                ])
        }
    }
}
