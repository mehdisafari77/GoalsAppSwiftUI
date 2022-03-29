//
//  GoalViewModel.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import Foundation
import UIKit
import SwiftUI

struct GoalViewModel {
    var goal: Goal
    
    var id: String {
        goal.id ?? ""
    }
    
    var name: String {
        goal.name + " "
    }
    
    var dueOnDate: Date {
        goal.dueOn
    }
    
    var dueOn: String {
        goal.dueOn.toRelativeDate()
    }
    
    var color: Color {
        Color(UIColor(hexString: goal.color))
    }
    
    var icon: String {
        goal.icon
    }
    
    var items: [String] {
        get {
            return goal.items
        }
        
        set(newItems) {
            goal.items = newItems
        }
    }
}
