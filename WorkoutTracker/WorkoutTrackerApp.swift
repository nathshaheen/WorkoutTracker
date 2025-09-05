//
//  WorkoutTrackerApp.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 5/9/2025.
//

import SwiftUI
import SwiftData

@main
struct WorkoutTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Workout.self, Exercise.self, ExerciseSet.self])
        }
    }
}
