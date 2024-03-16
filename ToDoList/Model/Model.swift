//
//  Model.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import Foundation

struct TaskModel: Identifiable {
    let id = UUID()
    let title: String
    let isCompleted: Bool = false
}
