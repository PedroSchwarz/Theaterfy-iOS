//
//  MovieDetailsPage.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct MovieDetailsPage: View {
    var movie: Movie
    
    @StateObject private var viewModel = AppModules.container.resolve(MovieDetailsViewModel.self)!
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                MovieDetailsCarousel(images: [movie.posterUrl, movie.backdropUrl], size: 400)
            }
        }
        .onAppear {
            viewModel.callGetMovieDetails(movie.id)
        }
    }
}

struct MovieDetailsPage_Previews: PreviewProvider {
    static let movie = MovieModel.dumbInstance().toEntity()
    
    static var previews: some View {
        MovieDetailsPage(movie: movie)
    }
}
