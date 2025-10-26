//
//  SetSessionAddView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 26/10/2025.
//

import SwiftData
import SwiftUI

struct SetSessionAddView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    let exerciseSession: ExerciseSession
    
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
        exerciseSession.sets.append(SetSession(weight: weight ?? 0.00, reps: reps ?? 0, completed: false))
        
        do {
            try context.save()
            dismiss()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let testExerciseSession: ExerciseSession = ExerciseSession(name: "Test Exercise Session", sets: [])
    
    SetSessionAddView(exerciseSession: testExerciseSession)
}

