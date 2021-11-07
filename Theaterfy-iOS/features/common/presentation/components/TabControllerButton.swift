//
//  TabControllerButton.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import SwiftUI

struct TabControllerButton: View {
    var active: Bool
    var label: String
    var icon: String
    var onSelected: () -> Void
    
    var body: some View {
        Button {
            onSelected()
        } label: {
            HStack {
                Image(systemName: icon)
                    .font(.title3.bold())

                if active {
                    Text(label)
                        .font(.title3.bold())
                        .transition(.asymmetric(insertion: .slide, removal: .move(edge: .trailing)))
                        .animation(.easeInOut(duration: 0.5), value: active)
                }
            }
            .foregroundColor(CommonColors.SteelBlueColor)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: active ? 50 : 100)
                    .fill(CommonColors.MovieItemBackground)
                    .animation(.easeInOut(duration: 0.3), value: active)
                    .overlay(RoundedRectangle(cornerRadius: active ? 50 : 100)
                                .stroke(lineWidth: active ? 2 : 0)
                                .fill(CommonColors.SteelBlueColor)
                                .animation(.easeInOut(duration: 0.3), value: active))
            )
        }
    }
}

struct TabControllerButton_Previews: PreviewProvider {
    static var previews: some View {
        TabControllerButton(active: false, label: "Now Playing", icon: "link") {
            print("Selected")
        }
    }
}
