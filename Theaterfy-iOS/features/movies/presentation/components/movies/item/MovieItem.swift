//
//  MovieItem.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 27/10/21.
//

import SwiftUI

struct MovieItem: View {
    var movie: Movie
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack(spacing: 5) {
                // MovieImage
                MovieImage(image: self.movie.posterUrl)
                // Movie Content
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.movie.title)
                        .font(.title3).bold()
                    Text(self.movie.overview)
                        .font(.footnote)
                }
                .padding(10)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                
                MovieItemExtras(
                    votes: self.movie.voteAverage,
                    releaseDate: self.movie.releaseDate
                )
            }
            .background(Material.regular)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
            .shadow(color: CommonColors.ShadowColor, radius: 10, x: 0, y: 0)
        } else {
            VStack(spacing: 5) {
                // MovieImage
                MovieImage(image: self.movie.posterUrl)
                // Movie Content
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.movie.title)
                        .font(.title3).bold()
                    Text(self.movie.overview)
                        .font(.footnote)
                }
                .padding(10)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                
                MovieItemExtras(
                    votes: self.movie.voteAverage,
                    releaseDate: self.movie.releaseDate
                )
            }
            .background(CommonColors.MovieItemBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
            .shadow(color: CommonColors.ShadowColor, radius: 10, x: 0, y: 0)
        }
    }
}

struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem(movie: MovieModel.dumbInstance().toEntity())
    }
}
