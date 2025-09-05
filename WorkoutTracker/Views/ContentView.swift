//
//  ContentView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 5/9/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query(sort: \Workout.date, order: .forward) var workouts: [Workout]
        
    @Environment(\.modelContext) private var modelContext
    @State private var newExerciseName = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(workouts) { workout in
                    Section(header: Text(workout.date, style: .date)) {
                        ForEach(workout.exercises) { exercise in
                            VStack(alignment: .leading) {
                                Text(exercise.name).bold()
                                ForEach(exercise.sets) { set in
                                    Text("Set \(set.setNumber): \(set.reps) reps, \(set.weight)kg, RPE \(set.rpe)")
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                Button("Add Today") {
                    let newWorkout = Workout(date: Date())
                    modelContext.insert(newWorkout)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
