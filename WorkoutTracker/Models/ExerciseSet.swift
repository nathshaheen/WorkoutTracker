//
//  ExerciseSet.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 5/9/2025.
//

import Foundation
import SwiftData

@Model
class ExerciseSet: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var setNumber: Int
    var reps: Int
    var weight: Double
    var rpe: Double
    
    init(setNumber: Int, reps: Int, weight: Double, rpe: Double) {
        self.setNumber = setNumber
        self.reps = reps
        self.weight = weight
        self.rpe = rpe
    }
}
