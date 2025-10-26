//
//  ExerciseSessionAddView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 26/10/2025.
//

import SwiftData
import SwiftUI

struct ExerciseSessionAddView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    let workoutSession: WorkoutSession
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
            }
            
            .navigationTitle("Add a New Exercise")
            
            .toolbar {
                ToolbarItem() {
                    Button {
                        save()
                    } label: {
                        Label("Save", systemImage: "checkmark").labelStyle(.iconOnly)
                    }
                }
            }
        }
    }
    
    private func save() {
        let newExerciseSession = ExerciseSession(name: name, sets: [])
        
        workoutSession.exercises.append(newExerciseSession)
        
        do {
            try context.save()
            dismiss()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let testWorkoutSession: WorkoutSession = WorkoutSession(name: "Workout 1", date: .now, exercises: [])
    
    ExerciseSessionAddView(workoutSession: testWorkoutSession)
}
