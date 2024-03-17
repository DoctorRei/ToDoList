//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

struct AddTaskView: View {
    
    //MARK: - Properties
    @Environment (\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        //MARK: - Background
        ZStack {
            BackgroundView()
            
            VStack {
                
                //MARK: - TextField
                CustomTextField(placeholder: "Enter your new task")
                
                //MARK: - Button
                CustomButton(titleButton: "Add new Task") {
                    viewModel.addTask(with: viewModel.newTask)
                }
                Spacer()
            }
            .padding()
        }
        //MARK: - Nav Bar
        
        .navigationTitle("Add Task")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        
        //MARK: - Back Button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundColor(.toDoAccent)
                }
            }
        }
        .onAppear {
            viewModel.newTask = ""
        }
    }
}

//MARK: - Preview
struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
                .environmentObject(ViewModel())
                .preferredColorScheme(.dark)
            
        }
    }
}
