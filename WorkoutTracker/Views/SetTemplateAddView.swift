//
//  SetTemplateAddView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 21/10/2025.
//

import SwiftUI

struct SetTemplateAddView: View {
    @State private var weight: Double?
    @State private var reps: Int?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Weight", value: $weight, format: .number)
                    .keyboardType(.decimalPad)
                TextField("Reps", value: $reps, format: .number)
                    .keyboardType(.numberPad)
            }
            
            .navigationTitle("Add a New Set")
            
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
    SetTemplateAddView()
}
