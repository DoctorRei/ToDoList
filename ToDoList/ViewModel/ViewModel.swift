//
//  ViewModel.swift
//  ToDoList
//
//  Created by Акира on 16.03.2024.
//

import Foundation

class ViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var tasks: [TaskModel] = []
    @Published var newTask = ""

    //MARK: - Methods
    func addTask(with task: String) {
        let model = TaskModel(title: task, isCompleted: false)
        tasks.append(model)
    }
    
    func isCompletedTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func deleteTask(with task: IndexSet) {
        tasks.remove(atOffsets: task)
    }
}
