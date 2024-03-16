//
//  ContentView.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
            .preferredColorScheme(.dark)
    }
}
