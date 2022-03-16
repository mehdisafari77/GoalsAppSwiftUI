//
//  AddNewGoal.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import SwiftUI

struct AddNewGoal: View {
    
    @StateObject private var addGoalVM: AddGoalViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    init(repo: GoalRepositoryProtocol) {
        _addGoalVM = StateObject<AddGoalViewModel>.init(wrappedValue: AddGoalViewModel(repo: repo))
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Form {
                    Section {
                        TextField("Goal Title", text: $addGoalVM.name)
                        
                        DatePicker(selection: $addGoalVM.dueOn, in: Date()..., displayedComponents: .date) {
                            Text("Select goal due date")
                        }.id(addGoalVM.dueOn)
                        
                        ColorPicker("Select goal color", selection: $addGoalVM.color)
                        
                        EmojiTextField(text: $addGoalVM.icon, placeholder: "Enter emoji icon")
                    }
                }.frame(maxHeight: 200)
                
                List {
                    HStack {
                        TextField("Enter one goal...", text: $addGoalVM.goal)
                            .onSubmit {
                                addGoalVM.addGoalToList(item: addGoalVM.goal)
                            }
                            .submitLabel(.return)
                    }
                    
                    ForEach(addGoalVM.items, id: \.self) { item in
                        Text(item)
                    }
                }.listStyle(.insetGrouped)
                    .navigationTitle("New Goal")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.primary)
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                addGoalVM.add()
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Save")
                                    .foregroundColor(.primary)
                            }
                        }
                    }
            }
        }
    }
}

struct AddNewGoal_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGoal(repo: MockGoalRepository())
    }
}
