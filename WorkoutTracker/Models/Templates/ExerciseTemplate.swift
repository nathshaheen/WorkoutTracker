//
//  ExerciseTemplate.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import Foundation
import SwiftData

@Model
final class ExerciseTemplate: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \SetTemplate.exerciseTemplate) var sets: [SetTemplate]
    weak var workoutTemplate: WorkoutTemplate?

    init(name: String, sets: [SetTemplate]) {
        self.id = UUID()
        self.name = name
        self.sets = sets
    }
}
