//
//  GoalView.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import SwiftUI

struct GoalView: View {
    
    let goalViewModel: GoalViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(goalViewModel.name)
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
            
            Text(goalViewModel.dueOn.lowercased())
            
            HStack(alignment: .bottom) {
                Text("\(goalViewModel.items.count) items")
                    .padding(.top, 20)
                Spacer()
                Text(goalViewModel.icon)
                    .font(.largeTitle)
            }
        }.foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(goalViewModel.color))
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(goalViewModel: GoalViewModel(goal: Goal.sampleGoals()[1]))
    }
}

