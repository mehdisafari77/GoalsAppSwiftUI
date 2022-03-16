//
//  Goal.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import Foundation

struct Goal: Codable {
    var id: String?
    var name: String
    var dueOn: Date
    var color: String
    var icon: String
    var items: [String]
}

extension Goal {
    static func sampleGoals() -> [Goal] {
        return  [
            Goal(id: UUID().uuidString, name: "Work", dueOn: Date(), color: "#0984e3", icon: "💼", items: [
                "Work on youtube",
                "Publish youtube",
                "Upload source code"
            ]),
            
            Goal(id: UUID().uuidString, name: "Personal", dueOn: Date(), color: "#e17055", icon: "🔐", items: [
                "Clean grill",
                "Get groceries",
                "Garage cleanup",
                "Lock the door"
            ]),
            Goal(id: UUID().uuidString, name: "Fitness", dueOn: Date(), color: "#6c5ce7", icon: "🏃‍♂️", items: [
                "Workout 45 min everyday",
                "Go for walk",
            ]),
            
            Goal(id: UUID().uuidString, name: "Travel", dueOn: Date(), color: "#00b894", icon: "🛫", items: [
                "Book Mexico tickets",
                "Check Mexico top travel destinations",
                "Find hotel to stay in Mexico near destinations",
                "Find good eateries"
            ]),
            Goal(id: UUID().uuidString, name: "Gigs", dueOn: Date(), color: "#fd79a8", icon: "✨", items: [
                "Fix blog page",
                "Redesign layout for navigation"
            ]),
            
            Goal(id: UUID().uuidString, name: "Career", dueOn: Date(), color: "#2d3436", icon: "👔", items: [
                "Learn about new career trend",
            ]),
        ]
    }
}
