//
//  TemplateView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import SwiftUI

struct TemplateView: View {
    var workouts: [WorkoutTemplate]
    
    @State private var showingSheet: Bool = false
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(workouts) { workout in
                    GroupBox {
                        NavigationLink(destination: WorkoutTemplateView(workout: workout)) {
                            HStack {
                                Text(workout.name)
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }

                }
                .onDelete(perform: delete)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Workout")
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
                WorkoutAddView()
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {

    }
}

#Preview {
    let testWorkouts: [WorkoutTemplate] = [WorkoutTemplate(name: "Workout 1", exercises: []), WorkoutTemplate(name: "Workout 2", exercises: []), WorkoutTemplate(name: "Workout 3", exercises: [])]
    
    TemplateView(workouts: testWorkouts)
}
