//
//  WorkoutTemplate.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import Foundation
import SwiftData

@Model
final class WorkoutTemplate: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \ExerciseTemplate.workoutTemplate) var exercises: [ExerciseTemplate]
    
    init(name: String, exercises: [ExerciseTemplate]) {
        self.id = UUID()
        self.name = name
        self.exercises = exercises
    }
}
