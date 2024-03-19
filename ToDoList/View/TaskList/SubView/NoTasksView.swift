//
//  NoTasksView.swift
//  ToDoList
//
//  Created by Акира on 18.03.2024.
//

import SwiftUI

struct NoTasksView: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            //MARK: - Text
            Text("THERE ARE NO TASKS\nWOULD YOU LIKE \nTO ADD?")
                .foregroundColor(.toDoPrimary)
                .font(.title)
                .opacity(0.5)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            //MARK: - Add Task View Button
            NavigationLink(destination: AddTaskView()) {
                ZStack {
                    Circle()
                        .frame(width: 100)
                        .opacity(0.5)
                        .foregroundColor(.toDoPrimary)
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color.toDoBackgroundOne)
                        .font(.largeTitle)
                }
            }
            .padding()
        }
    }
}

//MARK: - Preview
struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NoTasksView()
            .preferredColorScheme(.dark)
    }
}
