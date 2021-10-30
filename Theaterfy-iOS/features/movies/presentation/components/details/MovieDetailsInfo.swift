//
//  SwiftUIView.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct MovieDetailsInfo: View {
    var runtime: String
    var homepage: String?
    
    var body: some View {
        HStack {
            Text(MoviesLocales.runtimeOf)
                .font(.subheadline)
            Text(runtime)
                .foregroundColor(.accentColor)
            
            Spacer()
            
            if let link = URL(string: homepage ?? "") {
                Link(destination: link) {
                    HStack {
                        Text(MoviesLocales.learnMoreHere)
                        Image(systemName: MoviesIcons.link)
                    }
                    .foregroundColor(CommonColors.SteelBlueColor)
                }
            }
        }
    }
}

struct MovieDetailsInfo_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsInfo(runtime: "1h30m")
    }
}
