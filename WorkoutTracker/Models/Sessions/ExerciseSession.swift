//
//  ExerciseSession.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import Foundation
import SwiftData

@Model
final class ExerciseSession: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \SetSession.exerciseSession) var sets: [SetSession] = []
    weak var workoutSession: WorkoutSession?

    init(name: String, sets: [SetSession]) {
        self.id = UUID()
        self.name = name
        self.sets = sets
    }
}
