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
                    
                } label: {
                    Text("Cancel")
                        .frame(width: 56)
                        .foregroundColor(.toDoAccent)
                }

            }
            .padding(.vertical)
            
            CustomTextField(placeholder: "Edit your  task")
            CustomButton(titleButton: "Save") {
                
            }
            Spacer()
        }
        .padding()
        .background(
            BackgroundView()
        )
    }
}

//MARK: - Preview
struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView()
            .environmentObject(ViewModel())
            .preferredColorScheme(.dark)
    }
}
