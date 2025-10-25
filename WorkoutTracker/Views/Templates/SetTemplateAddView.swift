//
//  SetTemplateAddView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 21/10/2025.
//

import SwiftData
import SwiftUI

struct SetTemplateAddView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    let exerciseTemplate: ExerciseTemplate
    
    @State private var weight: Double?
    @State private var reps: Int?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Weight", value: $weight, format: .number)
                    .keyboardType(.decimalPad)
                TextField("Reps", value: $reps, format: .number)
                    .keyboardType(.numberPad)
            }
            
            .navigationTitle("Add a New Set")
            
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
        exerciseTemplate.sets.append(SetTemplate(weight: weight ?? 0.00, reps: reps ?? 0))
        
        do {
            try context.save()
            dismiss()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let testExerciseTemplate: ExerciseTemplate = ExerciseTemplate(name: "Test Exercise Template", sets: [])
    
    SetTemplateAddView(exerciseTemplate: testExerciseTemplate)
}
