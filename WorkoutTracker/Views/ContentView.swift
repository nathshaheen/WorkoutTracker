//
//  ContentView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import SwiftUI

struct ContentView: View {
    let testSessionWorkouts: [WorkoutSession] = [WorkoutSession(name: "Workout 1", date: Date(), exercises: []), WorkoutSession(name: "Workout 2", date: Date(), exercises: []), WorkoutSession(name: "Workout 3", date: Date(), exercises: [])]
    
    let testTemplateWorkouts: [WorkoutTemplate] = [WorkoutTemplate(name: "Workout 1", exercises: []), WorkoutTemplate(name: "Workout 2", exercises: []), WorkoutTemplate(name: "Workout 3", exercises: [])]
    
    var body: some View {
        TabView {
            Tab("Sessions", systemImage: "figure.run.circle.fill") {
                SessionView(workouts: testSessionWorkouts)
            }
            
            Tab("Templates", systemImage: "line.3.horizontal") {
                TemplateView(workouts: testTemplateWorkouts)
            }
        }
    }
}

#Preview {
    ContentView()
}
