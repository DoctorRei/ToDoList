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
        let model = TaskModel(title: task)
        tasks.append(model)
    }
}
