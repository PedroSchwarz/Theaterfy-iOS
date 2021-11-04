//
//  MovieDetailsListCapsule.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 03/11/21.
//

import SwiftUI

struct MovieDetailsListCapsule: View {
    var label: String
    
    var body: some View {
        Text(self.label)
            .bold()
            .foregroundColor(.primary)
            .padding(.vertical)
            .padding(.horizontal, 20)
            .overlay(Capsule().stroke(lineWidth: 2).fill(Color.primary))
            .padding(.trailing, 5)
    }
}

struct MovieDetailsListCapsule_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsListCapsule(label: "Test")
    }
}
