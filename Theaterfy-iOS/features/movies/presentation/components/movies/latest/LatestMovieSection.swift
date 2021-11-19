//
//  LatestMovieSection.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import SwiftUI

struct LatestMovieSection: View {
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(MoviesLocales.latestMovie)
                .font(.largeTitle)
                .bold()
                .foregroundColor(CommonColors.SteelBlueColor)
            
            NavigationLink {
                MovieDetailsPage(movie: movie)
            } label: {
                LatestMovieItem(movie: movie)
            }
        }
        .padding(.horizontal, 10)
        .padding(.top, 30)
    }
}
//
//struct LatestMovieSection_Previews: PreviewProvider {
//    static var previews: some View {
//        LatestMovieSection()
//    }
//}
