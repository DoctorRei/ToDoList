//
//  TaskListView.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

struct TaskListView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    @State private var isEditViewPresented = false
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                
                //MARK: - Background color
                BackgroundView()
                
                VStack {
                    if viewModel.tasks.isEmpty {
                        
                        //MARK: - Empty list
                        NoTasksView()
                    } else {
                        //MARK: - Task List
                        List {
                            ForEach(viewModel.tasks) { task in
                                TaskRow(model: task) {
                                    viewModel.isCompletedTask(task: task)
                                }
                                .onTapGesture {
                                    viewModel.selectedTask = task
                                    isEditViewPresented = true
                                }
                            }
                            .onDelete(perform: viewModel.deleteTask)
                            
                            //MARK: - Edit View
                            .sheet(isPresented: $isEditViewPresented) {
                                if let selectedTask = viewModel.selectedTask {
                                    EditTaskView(task: selectedTask)
                                }
                            }
                        }
                        .listStyle(.plain)
                        
                        //MARK: - Progress bar
                        ProgressView(
                            "Task Completion",
                            value: viewModel.completionRate
                        )
                        .progressViewStyle(.linear)
                        .tint(.toDoPrimary)
                        .padding()
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
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
