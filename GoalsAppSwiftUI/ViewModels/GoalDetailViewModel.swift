//
//  GoalDetailViewModel.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import Foundation
import UIKit
import SwiftUI

class GoalDetailViewModel: ObservableObject {
    private var repo: GoalRepositoryProtocol
    
    @Published var goal: GoalViewModel
    
    var item = ""
    
    init(repo: GoalRepositoryProtocol, goal: GoalViewModel) {
        self.repo = repo
        self.goal = goal
    }
    
    func add(item: String) {
        repo.addAGoalItem(goalId: goal.id, item: item) { result in
            switch result {
            case .success(let newGoal):
                if let newGoal = newGoal {
                    DispatchQueue.main.async {
                        self.goal = GoalViewModel(goal: newGoal)
                        self.item = ""
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func delete(item: String) {
        repo.deleteGoalItem(goalId: goal.id, item: item) { result in
            switch result {
            case .success(let newGoal):
                if let newGoal = newGoal {
                    DispatchQueue.main.async {
                        self.goal = GoalViewModel(goal: newGoal)
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

