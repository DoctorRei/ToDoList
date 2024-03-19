//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    //MARK: - Properties
    @AppStorage("isDarkMode") private var isDarkMode = true
    @StateObject var viewModel = ViewModel()
    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContainerView()
                .environmentObject(viewModel)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
