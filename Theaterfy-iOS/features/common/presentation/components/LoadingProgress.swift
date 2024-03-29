//
//  LoadingProgress.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 27/10/21.
//

import SwiftUI

struct LoadingProgress: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .frame(height: CommonProperties.screenHeight / 2)
    }
}

struct LoadingProgress_Previews: PreviewProvider {
    static var previews: some View {
        LoadingProgress()
    }
}
