//
//  ContentView.swift
//  ToDoList
//
//  Created by Акира on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .bold()
                .padding()
            HStack {
                Image(systemName: "heart")
                Image(systemName: "heart")
                Image(systemName: "heart")
            }
            .padding()
            Button("Press Me \(Image(systemName: "heart"))") {
                print("Hello there")
            }
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
