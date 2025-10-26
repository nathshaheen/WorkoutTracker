//
//  WorkoutTemplateView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import SwiftUI

struct WorkoutTemplateView: View {
    var workout: WorkoutTemplate
    
    enum Sheet: Identifiable {
        case addExerciseTemplate

        var id: String {
            switch self {
                case .addExerciseTemplate: return "addExerciseTemplate"
            }
        }
    }

    @State private var showingSheet: Sheet?
            
    var body: some View {
        NavigationStack {
            List {
                ForEach(workout.exercises) { exercise in
                    ExerciseTemplateView(exercise: exercise)
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle(workout.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
                
                ToolbarSpacer(placement: .bottomBar)
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showingSheet = .addExerciseTemplate
                    } label: {
                        Label("Add", systemImage: "plus").labelStyle(.iconOnly)
                    }
                }
            }
            
            .sheet(item: $showingSheet) { sheet in
                switch sheet {
                    case .addExerciseTemplate:
                        ExerciseTemplateAddView(workoutTemplate: workout)
                }
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {

    }
}

#Preview {
    let testWorkoutTemplate: WorkoutTemplate = WorkoutTemplate(name: "Workout 1", exercises: [ExerciseTemplate(name: "Exercise 1", sets: [SetTemplate(weight: 100, reps: 10), SetTemplate(weight: 100, reps: 10), SetTemplate(weight: 80, reps: 5)]), ExerciseTemplate(name: "Exercise 2", sets: [SetTemplate(weight: 50, reps: 5), SetTemplate(weight: 50, reps: 10)])])
    
    WorkoutTemplateView(workout: testWorkoutTemplate)
}
