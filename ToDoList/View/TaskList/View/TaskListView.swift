//
//  TaskListView.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                
                //MARK: - Background color
                LinearGradient(
                    colors: [Color.toDoBackgroundOne, Color.toDoBackgroundTwo],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                VStack {
                    
                    //MARK: - Task List
                    List {
                        ForEach(viewModel.tasks) { task in
                            TaskRow(model: task) {
                                print("Hello")
                            }
                        }
                    }
                    .listStyle(.plain)
                }
                
                //MARK: - Nav Bar
                .navigationTitle("To Do List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddTaskView()) {
                            Image(systemName: "plus")
                                .foregroundColor(Color.toDoPrimary)
                        }
                    }
                }
            }
        }
    }
}

//MARK: - Preview
struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
            .environmentObject(ViewModel())
            .preferredColorScheme(.dark)
    }
}
