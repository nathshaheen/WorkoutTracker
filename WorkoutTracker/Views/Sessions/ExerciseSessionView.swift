//
//  ExerciseSessionView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 25/10/2025.
//

import SwiftUI

struct ExerciseSessionView: View {
    @State var exercise: ExerciseSession
    
    @State private var showingSheet: Sheet?
    
    enum Sheet: Identifiable {
        case addSetSession

        var id: String {
            switch self {
            case .addSetSession: return "addSetSession"
            }
        }
    }
    
    var body: some View {
        Section {
            HStack {
                Spacer()
                Text("Weight")
                Spacer()
                Text("Reps")
                Spacer()
                Text("Completed")
                Spacer()
            }
            .deleteDisabled(true)
            
            ForEach(exercise.sets) { set in
                GroupBox {
                    HStack {
                        Spacer()
                        Text(String(format: "%.2f", set.weight))
                        Spacer()
                        Text(String(set.reps))
                        Spacer()
                        Text(String(set.completed))
                        Spacer()
                    }
                }
            }
            .onDelete { offsets in
                
            }
            
            GroupBox {
                Button {
                    showingSheet = .addSetSession
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
            
            .sheet(item: $showingSheet) { sheet in
                switch sheet {
                    case .addSetSession:
                        SetSessionAddView(exerciseSession: exercise)
                }
            }
        }
    }
}
