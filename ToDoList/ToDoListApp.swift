//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
