//
//  TaskListView.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

struct TaskListView: View {
    
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
            }
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

//MARK: - Preview

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
            .preferredColorScheme(.dark)
    }
}
