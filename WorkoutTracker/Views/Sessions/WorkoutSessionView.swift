//
//  WorkoutSessionView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 21/10/2025.
//

import SwiftUI

struct WorkoutSessionView: View {
    var workout: WorkoutSession
    
    enum Sheet: Identifiable {
        case addExerciseSession
        case addSetSession

        var id: String {
            switch self {
                case .addExerciseSession: return "addExerciseSession"
                case .addSetSession: return "addSetSession"
            }
        }
    }

    @State private var showingSheet: Sheet?
            
    var body: some View {
        NavigationStack {
            List {
                ForEach(workout.exercises) { exercise in
                    ExerciseSessionView(exercise: exercise)
                }
                .onDelete(perform: delete)
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
                        showingSheet = .addExerciseSession
                    } label: {
                        Label("Add", systemImage: "plus").labelStyle(.iconOnly)
                    }
                }
            }
            
            .sheet(item: $showingSheet) { sheet in
//                switch sheet {
//                    case .addExerciseSession:
//                        ExerciseTemplateAddView()
//                    case .addSetSession:
//                        SetTemplateAddView()
//                }
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {

    }
}

#Preview {
    let testWorkout: WorkoutSession = WorkoutSession(name: "Workout 1", date: Date(), exercises: [ExerciseSession(name: "Exercise 1", sets: [SetSession(weight: 100, reps: 10, completed: true), SetSession(weight: 100, reps: 10, completed: false), SetSession(weight: 80, reps: 5, completed: false)]), ExerciseSession(name: "Exercise 2", sets: [SetSession(weight: 50, reps: 5, completed: true), SetSession(weight: 50, reps: 10, completed: false)])])
    
    WorkoutSessionView(workout: testWorkout)
}
