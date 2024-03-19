//
//  SwiftUIView.swift
//  ToDoList
//
//  Created by Акира on 19.03.2024.
//

import SwiftUI

struct LaunchScreen: View {
    
    //MARK: - Progress
    @Binding var isPresented: Bool
    @State var progress: CGFloat = 0.0
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    
    var body: some View {
        ZStack {
            
            //MARK: - Background Color
            BackgroundView()
            
            ZStack {
                
                //MARK: - Rectangle + CheckMark on midle view
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .opacity(0.25)
                Image(systemName: "checkmark")
                    .font(.largeTitle)
                    .bold()
                
                VStack {
                    Spacer()
                    
                    //MARK: - ProgressBar
                    CustomProgressBar(initialProgress: $progress, barColor: Color.toDoPrimary)
                        .frame(height: 8)
                        .onReceive([self.progress].publisher) { _ in
                            if self.progress >= 1.0 {
                                self.isPresented = false
                            }
                        }
                        .padding(.bottom, 20)
                        .padding(.horizontal, 30)
                }
            }
        }
        .onAppear {
            self.startTimer()
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
            self.progress += 0.05
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen(isPresented: .constant(true))
            .preferredColorScheme(.dark)
    }
}
