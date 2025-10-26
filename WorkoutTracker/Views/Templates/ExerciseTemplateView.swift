//
//  ExerciseTemplateView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 25/10/2025.
//

import SwiftData
import SwiftUI

struct ExerciseTemplateView: View {
    @Environment(\.modelContext) var context
    
    @State var exercise: ExerciseTemplate
    
    @State private var showingSheet: Sheet?
    
    enum Sheet: Identifiable {
        case addSetTemplate

        var id: String {
            switch self {
            case .addSetTemplate: return "addSetTemplate"
            }
        }
    }
    
    var body: some View {
        Section {
            HStack {
                Spacer()
                Text("Weight")
                Spacer()
                Text("Reps")
                Spacer()
            }
            .deleteDisabled(true)
            
            ForEach($exercise.sets) { set in
                GroupBox {
                    HStack {
                        Spacer()
                        Text(String(format: "%.2f", set.weight.wrappedValue))
                        Spacer()
                        Text(String(set.reps.wrappedValue))
                        Spacer()
                    }
                }
            }
            .onDelete(perform: deleteSet)
            
            GroupBox {
                Button {
                    showingSheet = .addSetTemplate
                } label: {
                    Text("Add a New Set")
                }
                .frame(maxWidth: .infinity)
            }
            .deleteDisabled(true)
        } header: {
            VStack {
                HStack {
                    Text(exercise.name)
                    Spacer()
                    Button {
                        deleteExercise()
                    } label: {
                        Label("Options", systemImage: "line.3.horizontal").labelStyle(.iconOnly)
                    }
                }
            }
            
            .sheet(item: $showingSheet) { sheet in
                switch sheet {
                    case .addSetTemplate:
                        SetTemplateAddView(exerciseTemplate: exercise)
                }
            }
        }
    }
    
    private func deleteExercise() {
        context.delete(exercise)
        
        do {
            try context.save()
        } catch {
            print("Failed to delete: \(error.localizedDescription)")
        }
    }

    private func deleteSet(at offsets: IndexSet) {
        exercise.sets.remove(atOffsets: offsets)
        
        do {
            try context.save()
        } catch {
            print("Failed to delete: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let testExerciseTemplate: ExerciseTemplate = ExerciseTemplate(name: "Test Exercise Template", sets: [])
    
    ExerciseTemplateView(exercise: testExerciseTemplate)
}
