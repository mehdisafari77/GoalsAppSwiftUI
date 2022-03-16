//
//  FirebaseGoalRepository.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FirebaseGoalRepository: GoalRepositoryProtocol {
    
    private let db = Firestore.firestore()
    
    func add(goal: Goal, completion: @escaping (Result<Goal?, Error>) -> Void) {
        do {
            
            let ref = try db.collection("goals").addDocument(from: goal)
            
            ref.getDocument { snapshot, error in
                guard let snapshot = snapshot, error == nil else {
                    completion(.failure(error ?? NSError(domain: "snapshot is nil", code: 101, userInfo: nil)))
                    return
                }
                
                let goal = try? snapshot.data(as: Goal.self)
                completion(.success(goal))
            }
            
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func getAll(completion: @escaping (Result<[Goal]?, Error>) -> Void) {
        db.collection("goals").getDocuments { snapshot, error in
            guard let snapshot = snapshot, error == nil else {
                completion(.failure(error ?? NSError(domain: "snapshot is nil", code: 102, userInfo: nil)))
                return
            }
            
            let goals: [Goal]? = snapshot.documents.compactMap { doc in
                var goal = try? doc.data(as: Goal.self)
                if goal != nil {
                    goal!.id = doc.documentID
                }
                return goal
            }
            
            completion(.success(goals))
        }
    }
    
    
}
