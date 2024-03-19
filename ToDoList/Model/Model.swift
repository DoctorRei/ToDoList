//
//  Model.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}

