//
//  GoalListViewModel.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import Foundation

class GoalListViewModel: ObservableObject {
    private var repo: GoalRepositoryProtocol
    
    @Published var goals = [GoalViewModel]()
    
    init(repo: GoalRepositoryProtocol) {
        self.repo = repo
    }
    
    func getAllGoals() {
        repo.getAll { result in
            switch result {
            case .success(let fetchedGoals):
                if let fetchedGoals = fetchedGoals {
                    DispatchQueue.main.async {
                        self.goals = fetchedGoals.map(GoalViewModel.init)
                    }
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func deleteGoal(goalId: String) {
        repo.deleteGoal(goalId: goalId) { result in
            switch result {
            case .success(let success):
                if success {
                    self.getAllGoals()
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
