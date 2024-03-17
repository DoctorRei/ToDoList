//
//  CustomButton.swift
//  ToDoList
//
//  Created by Акира on 17.03.2024.
//

import SwiftUI

struct CustomButton: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    @Environment (\.dismiss) private var dismiss
    let titleButton: String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
            dismiss()
        } label: {
            Text(titleButton)
                .padding()
                .frame(maxWidth: .infinity)
                .font(.title2)
                .foregroundColor(Color.toDoBackgroundOne)
                .background(Color.toDoAccent)
                .cornerRadius(10)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(titleButton: "Add Task") {}
            .environmentObject(ViewModel())
            .preferredColorScheme(.dark)
    }
}
