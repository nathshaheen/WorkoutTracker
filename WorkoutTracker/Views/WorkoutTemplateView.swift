//
//  WorkoutTemplateView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import SwiftUI

struct WorkoutTemplateView: View {
    var workout: WorkoutTemplate
    
    @State private var showingSheet: Bool = false
        
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
                        showingSheet = true
                    } label: {
                        Label("Add", systemImage: "plus").labelStyle(.iconOnly)
                    }
                }
            }
            
            .sheet(isPresented: $showingSheet) {
                ExerciseAddView()
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
