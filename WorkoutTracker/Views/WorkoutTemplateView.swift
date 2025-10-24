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
        case addSetTemplate

        var id: String {
            switch self {
                case .addExerciseTemplate: return "addExerciseTemplate"
                case .addSetTemplate: return "addSetTemplate"
            }
        }
    }

    @State private var showingSheet: Sheet?
            
    var body: some View {
        NavigationStack {
            List {
                ForEach(workout.exercises) { exercise in
                    Section {
                        HStack {
                            Text("Weight")
                            Spacer()
                            Text("Reps")
                            Spacer()
                            Text("Completed")
                        }
                        .deleteDisabled(true)
                        
                        ForEach(exercise.sets) { set in
                            GroupBox {
                                HStack {
                                    Text(String(format: "%.2f", set.weight))
                                    Spacer()
                                    Text(String(set.reps))
                                    Spacer()
                                    Text(String(set.completed))
                                }
                            }
                        }
                        .onDelete { offsets in
                            
                        }
                        
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
                                    
                                } label: {
                                    Label("Options", systemImage: "line.3.horizontal").labelStyle(.iconOnly)
                                }
                            }
                        }
                    }
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
                    case .addSetTemplate:
                        SetTemplateAddView()
                }
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {

    }
}

#Preview {
    let testWorkout: WorkoutTemplate = WorkoutTemplate(name: "Workout 1", exercises: [ExerciseTemplate(name: "Exercise 1", sets: [SetTemplate(weight: 100, reps: 10, completed: true), SetTemplate(weight: 100, reps: 10, completed: false), SetTemplate(weight: 80, reps: 5, completed: false)]), ExerciseTemplate(name: "Exercise 2", sets: [SetTemplate(weight: 50, reps: 5, completed: true), SetTemplate(weight: 50, reps: 10, completed: false)])])
    
    WorkoutTemplateView(workout: testWorkout)
}
