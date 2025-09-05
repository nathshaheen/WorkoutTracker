//
//  Exercise.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 5/9/2025.
//

import Foundation
import SwiftData

@Model
class Exercise: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    @Relationship var sets: [ExerciseSet] = []
    init(name: String) { self.name = name }
}
