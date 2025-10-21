//
//  WorkoutAddView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 21/10/2025.
//

import SwiftUI

struct WorkoutAddView: View {
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
            }
            
            .navigationTitle("Add a New Workout")
            
            .toolbar {
                ToolbarItem() {
                    Button {
//                        save()
                    } label: {
                        Label("Save", systemImage: "checkmark").labelStyle(.iconOnly)
                    }
                }
            }
        }
    }
}

#Preview {
    WorkoutAddView()
}
