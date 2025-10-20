//
//  SetTemplate.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import Foundation
import SwiftData

@Model
final class SetTemplate: Identifiable {
    @Attribute(.unique) var id: UUID
    var weight: Double
    var reps: Int
    var completed: Bool
    weak var exerciseTemplate: ExerciseTemplate?

    init(weight: Double, reps: Int, completed: Bool) {
        self.id = UUID()
        self.weight = weight
        self.reps = reps
        self.completed = completed
    }
}
