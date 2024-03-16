//
//  TaskRow.swift
//  ToDoList
//
//  Created by Акира on 16.03.2024.
//

import SwiftUI

struct TaskRow: View {
    
    //MARK: - Properties
    var model: TaskModel
    var action: () -> ()
    
    var body: some View {
        HStack {
            
            //MARK: - Label
            model.isCompleted ?
            Text(model.title).strikethrough().foregroundColor(.toDoPrimary.opacity(0.5)) :
            Text(model.title)
            
            Spacer()
            
            //MARK: - Button toggle
            Button {
                action()
            } label: {
                Image(systemName: model.isCompleted ?
                    "checkmark.circle.fill" :
                        "circle"
                )
                .foregroundColor(.toDoAccent)
            }
            
        }
        .font(.headline)
        .padding()
        .background(model.isCompleted ?
                    Color.primary.opacity(0.1) :
                        Color.primary.opacity(0.25)
        )
        .cornerRadius(10)
        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .listRowBackground(Color.clear)
        .padding(.vertical, 6)
        .listRowSeparator(.hidden)
        
    }
}

//MARK: - Preview

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TaskRow(model: TaskModel(title: "First", isCompleted: true)) {}
            TaskRow(model: TaskModel(title: "Second", isCompleted: false)) {}
        }
        .listStyle(.plain)
        .preferredColorScheme(.dark)
    }
}
