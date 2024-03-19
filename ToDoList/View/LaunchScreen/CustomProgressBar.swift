//
//  CustomProgressBar.swift
//  ToDoList
//
//  Created by Акира on 19.03.2024.
//

import SwiftUI

struct CustomProgressBar: View {
    @Binding var progress: CGFloat
    private let barColor: Color
    private let animationTime: TimeInterval = 0.3
    
    public init(initialProgress: Binding<CGFloat>, barColor: Color) {
        self._progress = initialProgress
        self.barColor = barColor
    }
    
    var body: some View {
        GeometryReader { geometryReader in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(barColor.opacity(0.3))
                
                Rectangle()
                    .fill(barColor)
                    .frame(
                        width: min(geometryReader.size.width,
                         geometryReader.size.width * progress)
                    )
                    .animation(.linear)
            }
            .cornerRadius(20)
        }
       
    }
}

struct CustomProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressBar(initialProgress: .constant(10), barColor: .red)
            .preferredColorScheme(.dark)
    }
}
