//
//  WorkoutTemplateAddView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 21/10/2025.
//

import SwiftData
import SwiftUI

struct WorkoutTemplateAddView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
            }
            
            .navigationTitle("Add a New Workout")
            
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
        let newWorkoutTemplate = WorkoutTemplate(name: name, exercises: [])
        
        context.insert(newWorkoutTemplate)
        
        do {
            try context.save()
            dismiss()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
}

#Preview {
    WorkoutTemplateAddView()
}
