//
//  ExerciseTemplateAddView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 21/10/2025.
//

import SwiftData
import SwiftUI

struct ExerciseTemplateAddView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    let workoutTemplate: WorkoutTemplate
    
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
        let newExerciseTemplate = ExerciseTemplate(name: name, sets: [])
        
        workoutTemplate.exercises.append(newExerciseTemplate)
        
        do {
            try context.save()
            dismiss()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let testWorkoutTemplate: WorkoutTemplate = WorkoutTemplate(name: "Workout 1", exercises: [])
    
    ExerciseTemplateAddView(workoutTemplate: testWorkoutTemplate)
}
