//
//  MockGoalRepository.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import Foundation

class MockGoalRepository: GoalRepositoryProtocol {
    
    var goals = Goal.sampleGoals()
    
    func getAll(completion: @escaping (Result<[Goal]?, Error>) -> Void) {
        completion(.success(goals))
    }
    
    func add(goal: Goal, completion: @escaping (Result<Goal?, Error>) -> Void) {
        var goal = goal
        goal.id = UUID().uuidString
        goals.append(goal)
        completion(.success(goal))
    }
    
    func deleteGoal(goalId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        goals.removeAll { g in
            g.id == goalId
        }
        
        completion(.success(true))
    }
    
    func addAGoalItem(goalId: String, item: String, completion: @escaping (Result<Goal?, Error>) -> Void) {
        for i in 0..<goals.count {
            if goals[i].id == goalId {
                goals[i].items.append(item)
                completion(.success(goals[i]))
                return
            }
        }
    }
    
    func deleteGoalItem(goalId: String, item: String, completion: @escaping (Result<Goal?, Error>) -> Void) {
        for i in 0..<goals.count {
            if goals[i].id == goalId {
                goals[i].items.removeAll { it in
                    it == item
                }
                completion(.success(goals[i]))
                return
            }
        }
    }
}
