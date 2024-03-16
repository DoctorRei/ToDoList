//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

struct AddTaskView: View {
    
    //MARK: - Properties
    @State var newTask = ""
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        
        //MARK: - Background
        ZStack {
            LinearGradient(
                colors: [Color.toDoBackgroundOne, Color.toDoBackgroundTwo],
                 startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                
                //MARK: - TextField
                TextField("Enter your new task", text: $newTask)
                    .font(.title2)
                    .padding()
                    .background(Color.primary.opacity(0.15))
                    .cornerRadius(10)
                
                //MARK: - Button
                Button {
                    dismiss()
                } label: {
                    Text("Add Task")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .font(.title2)
                        .foregroundColor(Color.toDoBackgroundOne)
                        .background(Color.toDoAccent)
                        .cornerRadius(10)
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
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
                .preferredColorScheme(.dark )
        }
    }
}
