//
//  GoalsAppSwiftUIApp.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import SwiftUI
import Firebase

@main
struct GoalsAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(repo: MockGoalRepository())
            //ContentView(repo: FirebaseGoalRepository())
        }
    }
}
