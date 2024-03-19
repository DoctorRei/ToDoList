//
//  ViewModel.swift
//  ToDoList
//
//  Created by Акира on 16.03.2024.
//

import Foundation

class ViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTask()
        }
    }
    @Published var newTask = ""
    @Published var selectedTask: TaskModel?
    let keyUD = "KeyUD"
    
    init() {
        getTasks()
    }
    
    ///Progress View Property
    var completionRate: Double {
        let totalTasks = tasks.count
        let completedTasks = tasks.filter({ $0.isCompleted }).count
        
        return totalTasks > 0 ? Double(completedTasks) / Double(totalTasks) : 0
    }
    
    //MARK: - Create
    func addTask(with task: String) {
        let model = TaskModel(title: task, isCompleted: false)
        tasks.append(model)
    }
    
    //MARK: - Read
    func getTasks() {
        guard let data = UserDefaults.standard.data(forKey: keyUD) else { return }
        do {
            let decdableTasks = try JSONDecoder().decode([TaskModel].self, from: data)
            tasks = decdableTasks
        } catch  {
            print("Error saving taksk \(error)")
        }
    }
    
    //MARK: - Update
    func saveTask() {
        do {
            let encodeTasks = try JSONEncoder().encode(tasks)
            DispatchQueue.main.async {
                UserDefaults.standard.set(encodeTasks, forKey: self.keyUD)
            }
        } catch {
            print("Error saving taksk \(error)")
        }
    }
    
    func isCompletedTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func updateTask(with id: UUID, and title: String) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].title = title
        }
    }
    
    //MARK: - Delete
    func deleteTask(with task: IndexSet) {
        tasks.remove(atOffsets: task)
    }
}
