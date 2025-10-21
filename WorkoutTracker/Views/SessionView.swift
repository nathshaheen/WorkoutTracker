//
//  SessionView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 21/10/2025.
//

import SwiftUI

struct SessionView: View {
    var workouts: [WorkoutSession]
    
    @State private var showingSheet: Bool = false
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(workouts) { workout in
                    GroupBox {
                        NavigationLink(destination: WorkoutSessionView(workout: workout)) {
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
//                WorkoutSessionAddView()
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {

    }
}

#Preview {
    let testWorkouts: [WorkoutSession] = [WorkoutSession(name: "Workout 1", date: Date(), exercises: []), WorkoutSession(name: "Workout 2", date: Date(), exercises: []), WorkoutSession(name: "Workout 3", date: Date(), exercises: [])]
    
    SessionView(workouts: testWorkouts)
}
