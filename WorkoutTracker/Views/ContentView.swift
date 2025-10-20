//
//  ContentView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Workouts", systemImage: "figure.run.circle.fill") {
                Text("WorkoutView")
//                WorkoutView()
            }
            
            Tab("Templates", systemImage: "list.bullet") {
                Text("TemplateView")
//                TemplateView()
            }
        }
    }
}

#Preview {
    ContentView()
}
