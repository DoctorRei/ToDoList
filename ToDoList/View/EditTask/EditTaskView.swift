//
//  EditTaskView.swift
//  ToDoList
//
//  Created by Акира on 17.03.2024.
//

import SwiftUI

struct EditTaskView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    @Environment (\.dismiss) private var dismiss
    var task: TaskModel
    
    var body: some View {
        
        VStack {
            /// Title text
            HStack(alignment: .center) {
                Text("Edit Task")
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            
            /// Cancel Button
            .overlay(alignment: .topLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .frame(width: 56)
                        .foregroundColor(.toDoAccent)
                }

            }
            .padding(.vertical)
            
            //MARK: - TextField And Accept Button
            CustomTextField(placeholder: "Edit your task")
            CustomButton(titleButton: "Save") {
                viewModel.updateTask(with: task.id, and: viewModel.newTask)
            }
            .disabled(viewModel.newTask.isEmpty)
            Spacer()
        }
        .padding()
        .background(
            BackgroundView()
        )
        .onAppear {
            viewModel.newTask = task.title
        }
    }
}

//MARK: - Preview
struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task: TaskModel(title: "test 1", isCompleted: false))
            .environmentObject(ViewModel())
            .preferredColorScheme(.dark)
    }
}
