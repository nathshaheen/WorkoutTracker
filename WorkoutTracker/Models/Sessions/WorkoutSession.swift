//
//  WorkoutSession.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import Foundation
import SwiftData

@Model
final class WorkoutSession: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var date: Date
    @Relationship(deleteRule: .cascade, inverse: \ExerciseSession.workoutSession) var exercises: [ExerciseSession]

    init(name: String, date: Date, exercises: [ExerciseSession]) {
        self.id = UUID()
        self.name = name
        self.date = date
        self.exercises = exercises
    }
}
