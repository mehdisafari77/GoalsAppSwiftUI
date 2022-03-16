//
//  ContentView.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    private var repo: GoalRepositoryProtocol
    
    @ObservedObject var goalListViewModel: GoalListViewModel
    
    @State private var isEditing = false
    @State private var showAddNewGoal = false
    @State private var showGoals: Bool = false // animate Right
    @State private var showNewGoalsView: Bool = false // new sheet
    @State private var showSettingsView: Bool = false // new sheet

    
    init(repo: GoalRepositoryProtocol) {
        self.repo = repo
        
        goalListViewModel = GoalListViewModel(repo: repo)
        Theme.navigationBarColors(background: .clear, titleColor: .black, tintColor: .white)
    }
    
    private var goalItems: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }
    
    private func deleteButton(goal: GoalViewModel) -> some View {
        Button {
            goalListViewModel.deleteGoal(goalId: goal.id)
        } label: {
            Image(systemName: "minus.circle.fill")
        }
        .font(.title)
        .foregroundColor(isEditing ? .red : .clear)
        .offset(x: -90, y: -70)
    }
    
    var body: some View {

        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical, showsIndicators: false) {
                    homeHeader
                    LazyVGrid(columns: goalItems, spacing: 10) {
                        ForEach(goalListViewModel.goals, id: \.id) { goal in
                            NavigationLink(destination: GoalDetailView(goalDetailViewModel: GoalDetailViewModel(repo: repo, goal: goal))) {
                                
                                GoalView(goalViewModel: goal)
                                    .rotationEffect(.degrees(isEditing ? 2.5 : 0))
                                    .animation(Animation.easeInOut(duration: 0.12).repeat(while: isEditing), value: isEditing)
                                    .disabled(isEditing)
                                    .overlay(deleteButton(goal: goal))
                                
                            }
                        }
                    }.padding(.horizontal)
                }
                .onAppear {
                    goalListViewModel.getAllGoals()
                }
                .navigationTitle("Goals")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isEditing.toggle()
                        }) {
                            Text(isEditing ? "Done" : "Edit")
                                .foregroundColor(.primary)
                        }
                    }
                }

            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(repo: MockGoalRepository())
    }
}


extension ContentView {
    
    private var homeHeader: some View {
        HStack {
            Spacer()
            Button(action: {
                showSettingsView = true
            }) {
                CircleButtonView(iconName: "gear")
            }
            .opacity(isEditing ? 0.0 : 1.0)
            
            .sheet(isPresented: $showSettingsView, content: {
                SettingsView()
            })
            Button(action: {
                showNewGoalsView = true
            }) {
                CircleButtonView(iconName: "plus")
                    .rotationEffect(Angle(degrees: showAddNewGoal ? 180 : 0))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showAddNewGoal.toggle()
                    }
                }
            }
            .opacity(isEditing ? 0.0 : 1.0)
            
            .fullScreenCover(isPresented: $showAddNewGoal) {
                goalListViewModel.getAllGoals()
            } content: {
                AddNewGoal(repo: repo)
            }

            Spacer()
        }
        .onAppear {
            FirebaseGoalRepository().add(goal: Goal.sampleGoals()[0]) { result in
                switch result {
                case .success(let goal):
                    print(goal?.name ?? "")
                    print(goal?.items ?? "")
                    
                case .failure(let err):
                    print(err.localizedDescription)
                    
                }
            }
        }
        .padding(.horizontal)
    }
}
