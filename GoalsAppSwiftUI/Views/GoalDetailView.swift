//
//  GoalDetailView.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import SwiftUI

struct GoalDetailView: View {
    @ObservedObject var viewModel: GoalDetailViewModel
    
    init(goalDetailViewModel: GoalDetailViewModel) {
        self.viewModel = goalDetailViewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.goal.name)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Text(viewModel.goal.icon)
                }
                
                Text("Due: \(viewModel.goal.dueOn)")
                    .padding(.vertical)
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(LinearGradient(colors: [viewModel.goal.color, viewModel.goal.color.opacity(0.6)], startPoint: .top, endPoint: .bottom))
            
            List {
                HStack {
                    TextField("Enter goal", text: $viewModel.item)
                        .onSubmit {
                            viewModel.add(item: viewModel.item)
                        }
                        .submitLabel(.return)
                }
                
                ForEach(viewModel.goal.items, id: \.self) { item in
                    Text(item)
                }.onDelete { indexSet in
                    for i in indexSet {
                        viewModel.delete(item: viewModel.goal.items[i])
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GoalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailView(goalDetailViewModel: GoalDetailViewModel(repo: MockGoalRepository(), goal: GoalViewModel(goal: Goal.sampleGoals()[2])))
    }
}
