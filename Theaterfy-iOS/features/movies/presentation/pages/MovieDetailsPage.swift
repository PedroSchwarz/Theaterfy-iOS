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
            VStack(spacing: 20) {
                MovieDetailsCarousel(
                    images: [movie.posterUrl, movie.backdropUrl],
                    size: 400
                )
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(movie.title)
                        .font(.title)
                        .bold()
                    
                    HStack {
                        Text(MoviesLocales.releasedOn)
                            .font(.subheadline)
                        Text(movie.releaseDate)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        switch viewModel.actionsState {
                        case .Done(let result):
                            MovieDetailsActions(watchLater: result.0, favorite: result.1)
                        }
                    }
                    
                    Text(movie.overview)
                        .font(.title2)
                }
                .padding(.horizontal)
                
                MovieDetailsContent(
                    movie: movie,
                    state: viewModel.state
                )
                
                MovieDetailsRecommendations(state: viewModel.recommendationsState)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
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
