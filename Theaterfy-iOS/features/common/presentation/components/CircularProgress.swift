//
//  CircularProgress.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 03/11/21.
//

import SwiftUI

struct CircularProgress: View {
    var size: CGFloat
    var value: Double
    var showAnimation: Bool = false
    
    @State private var startAnimation = false
    
    var body: some View {
        Circle()
            .stroke(
                Color.accentColor.opacity(0.2),
                style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)
            )
            .frame(width: self.size, height: self.size)
            .overlay(
                Circle()
                    .trim(from: !self.showAnimation || self.startAnimation ? self.value : 1, to: 1)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [.accentColor, CommonColors.SmoothPinkColor]),
                            startPoint: .bottomTrailing,
                            endPoint: .topLeading
                        ),
                        style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)
                    )
                    .frame(width: self.size, height: self.size)
                    .rotationEffect(.degrees(90))
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 1, y: 0, z: 0)
                    )
            )
            .shadow(color: .accentColor.opacity(0.3), radius: 5, y: 2)
            .onAppear {
                if self.showAnimation {
                    withAnimation(.easeOut(duration: 1)) {
                        self.startAnimation = true
                    }
                }
            }
    }
}

struct CircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgress(size: 100, value: 4.5)
    }
}
