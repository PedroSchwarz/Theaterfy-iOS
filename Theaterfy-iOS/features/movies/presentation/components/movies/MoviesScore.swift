//
//  MoviesScore.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 03/11/21.
//

import SwiftUI

struct MoviesScore: View {
    var size: CGFloat
    var value: Double
    var showAnimation: Bool = false
    
    var body: some View {
        CircularProgress(size: size, value: calcScore(), showAnimation: showAnimation)
            .overlay(
                Text(size < 70 ? "" : String(value))
                    .font(size > 120 ? .largeTitle : .title)
            )
    }
    
    private func calcScore() -> Double { -Double((value / 10) - 1) }
}

struct MoviesScore_Previews: PreviewProvider {
    static var previews: some View {
        MoviesScore(size: 100, value: 4.5)
    }
}
