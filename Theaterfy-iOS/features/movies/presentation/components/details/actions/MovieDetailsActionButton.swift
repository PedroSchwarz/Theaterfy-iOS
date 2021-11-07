//
//  MovieDetailsActionButton.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import SwiftUI

struct MovieDetailsActionButton: View {
    var onClicked: () -> Void
    var active: Bool
    var activeIcon: String
    var unactiveIcon: String
    var color: Color
    
    var body: some View {
        Button {
            onClicked()
            CommonGestures.makeHapticFeedback()
        } label: {
            Image(systemName: active ? activeIcon : unactiveIcon)
                .padding(10)
                .background(Circle().stroke(lineWidth: 2).fill(color))
                .foregroundColor(color)
                .opacity(active ? 1 : 0.5)
                .animation(.easeOut(duration: 1), value: active)
        }
    }
}
//
//struct MovieDetailsActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsActionButton()
//    }
//}
