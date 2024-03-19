//
//  ContainerView.swift
//  ToDoList
//
//  Created by Акира on 19.03.2024.
//

import SwiftUI

struct ContainerView: View {
    @State private var isLaunchScreenPresented = true
    
    var body: some View {
        if !isLaunchScreenPresented {
            ContentView()
        } else {
            LaunchScreen(isPresented: $isLaunchScreenPresented)
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .preferredColorScheme(.dark)
    }
}
