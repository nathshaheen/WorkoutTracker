//
//  Item.swift
//  WorkoutTracker
//
//  Created by Nathan Shaheen on 16/11/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
