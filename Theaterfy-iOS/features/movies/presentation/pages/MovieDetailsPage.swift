//
//  MovieDetailsPage.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct MovieDetailsPage: View {
    @Environment(\.presentationMode) var dismiss
    var movie: Movie
    @State private var animate: Bool = false
    
    @StateObject private var viewModel = AppModules.container.resolve(MovieDetailsViewModel.self)!
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                
                MovieDetailsCarousel(
                    images: [movie.posterUrl, movie.backdropUrl],
                    size: 400
                ) {
                    dismiss.wrappedValue.dismiss()
                }
                .scaleEffect(x: animate ? 1 : 0.8, y: animate ? 1 : 0.8, anchor: .top)
                .animation(.linear(duration: 0.5), value: animate)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(movie.title)
                        .font(.title)
                        .bold()
                        .opacity(animate ? 1 : 0.5)
                        .animation(.linear(duration: 1), value: animate)
                        .offset(y: animate ? 0 : 30)
                        .animation(.easeOut(duration: 0.5), value: animate)
                    
                    HStack {
                        Text(MoviesLocales.releasedOn)
                            .font(.subheadline)
                        Text(movie.releaseDate)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        MovieDetailsActions(
                            watchLater: viewModel.watchLater,
                            favorite: viewModel.favorite
                        ) {
                            viewModel.callToggleMovieAction(movie: movie, type: .WatchLaterAction)
                        } onFavorite: {
                            viewModel.callToggleMovieAction(movie: movie, type: .FavoriteAction)
                        }
                    }
                    .opacity(animate ? 1 : 0.5)
                    .animation(.linear(duration: 1.2), value: animate)
                    .offset(y: animate ? 0 : 40)
                    .animation(.easeOut(duration: 0.7), value: animate)
                    
                    Text(movie.overview)
                        .font(.title2)
                        .opacity(animate ? 1 : 0.4)
                        .animation(.linear(duration: 1.4), value: animate)
                        .offset(y: animate ? 0 : 50)
                        .animation(.easeOut(duration: 0.9), value: animate)
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
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            viewModel.callGetMovieDetails(movie.id)
            animate.toggle()
        }
    }
}

struct MovieDetailsPage_Previews: PreviewProvider {
    static let movie = MovieModel.dumbInstance().toEntity()
    
    static var previews: some View {
        MovieDetailsPage(movie: movie)
    }
}
