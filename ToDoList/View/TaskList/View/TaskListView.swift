//
//  TaskListView.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var isEditViewPresented = false
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                
                //MARK: - Background color
                BackgroundView()
                VStack {
                    
                    //MARK: - Task List
                    List {
                        ForEach(viewModel.tasks) { task in
                            TaskRow(model: task) {
                                viewModel.isCompletedTask(task: task)
                            }
                            .onTapGesture {
                                isEditViewPresented = true
                            }
                        }
                        .onDelete(perform: viewModel.deleteTask)
                        
                        //MARK: - Edit View
                        .sheet(isPresented: $isEditViewPresented) {
                            EmptyView()
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
