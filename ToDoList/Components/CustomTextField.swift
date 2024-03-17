//
//  CustomTextField.swift
//  ToDoList
//
//  Created by Акира on 17.03.2024.
//

import SwiftUI

struct CustomTextField: View {
    
    @EnvironmentObject var viewModel: ViewModel
    let placeholder: String
    
    var body: some View {
        //MARK: - TextField
        TextField(placeholder, text: $viewModel.newTask)
            .font(.title2)
            .padding()
            .background(Color.primary.opacity(0.15))
            .cornerRadius(10)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholder: "Enter your new task")
            .environmentObject(ViewModel())
            .preferredColorScheme(.dark)
    }
}
