//
//  WorkoutSessionAddView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 24/10/2025.
//

import SwiftData
import SwiftUI

struct WorkoutSessionAddView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    var templates: [WorkoutTemplate]
    
    @State private var selectedTemplateID: UUID?
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select a template", selection: $selectedTemplateID) {
                    ForEach(templates) { template in
                        Text(template.name).tag(template.id as UUID?)
                    }
                }
            }
            .navigationTitle("Select a Template")
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
        guard let id = selectedTemplateID,
              let template = templates.first(where: { $0.id == id }) else {
            let template = WorkoutTemplate(name: "NO SELECTION", exercises: [])
            return
        }
        
        let sessionExercises = template.exercises.map { exerciseTemplate in
            ExerciseSession(name: exerciseTemplate.name, sets: exerciseTemplate.sets.map {
                SetSession(weight: $0.weight, reps: $0.reps, completed: false)
            })
        }
        
        let newSession = WorkoutSession(name: template.name, date: .now, exercises: sessionExercises)
        
        context.insert(newSession)
        
        do {
            try context.save()
            dismiss()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let testTemplates: [WorkoutTemplate] = [WorkoutTemplate(name: "Workout 1", exercises: []), WorkoutTemplate(name: "Workout 2", exercises: []), WorkoutTemplate(name: "Workout 3", exercises: [])]
    
    WorkoutSessionAddView(templates: testTemplates)
}
