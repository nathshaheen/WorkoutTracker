//
//  ContentView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import SwiftUI

struct ContentView: View {
    let testWorkouts: [WorkoutTemplate] = [WorkoutTemplate(name: "Workout 1", exercises: []), WorkoutTemplate(name: "Workout 2", exercises: []), WorkoutTemplate(name: "Workout 3", exercises: [])]
    
    var body: some View {
        TabView {
            Tab("Workouts", systemImage: "figure.run.circle.fill") {
                Text("WorkoutView")
//                WorkoutView()
            }
            
            Tab("Templates", systemImage: "line.3.horizontal") {
                TemplateView(workouts: testWorkouts)
            }
        }
    }
}

#Preview {
    ContentView()
}
