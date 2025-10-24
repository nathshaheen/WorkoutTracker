//
//  TemplateView.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 20/10/2025.
//

import SwiftData
import SwiftUI

struct TemplateView: View {
    @Environment(\.modelContext) var context
    
    var templates: [WorkoutTemplate]
    
    @State private var showingSheet: Bool = false
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(templates) { workout in
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
                WorkoutTemplateAddView()
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            context.delete(templates[index])
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let testTemplates: [WorkoutTemplate] = [WorkoutTemplate(name: "Workout 1", exercises: []), WorkoutTemplate(name: "Workout 2", exercises: []), WorkoutTemplate(name: "Workout 3", exercises: [])]
    
    TemplateView(templates: testTemplates)
}
