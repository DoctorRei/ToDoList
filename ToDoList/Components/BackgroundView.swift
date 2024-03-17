//
//  BackgroundView.swift
//  ToDoList
//
//  Created by Акира on 17.03.2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [Color.toDoBackgroundOne, Color.toDoBackgroundTwo],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
