//
//  Workout.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 5/9/2025.
//

import Foundation
import SwiftData

@Model
class Workout: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var date: Date
    @Relationship var exercises: [Exercise] = []
    init(date: Date) { self.date = date }
}
