//
//  MovieDetailsContent.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct MovieDetailsContent: View {
    var movie: Movie
    var state: MovieDetailsState
    @State private var animate: Bool = false
    
    var body: some View {
        switch state {
        case .Loading:
            LoadingProgress()
        case .Failure(let error):
            ErrorMessage(message: error)
        case .Success(let result):
            VStack {
                VStack(spacing: 20) {
                    MovieDetailsInfo(
                        runtime: result.runtime,
                        homepage: result.homepage
                    )
                    
                    MovieDetailsProfit(
                        revenue: result.revenue,
                        budget: result.budget,
                        profit: result.profit
                    )
                    
                    MovieDetailsVotes(
                        average: movie.voteAverage,
                        total: movie.voteCount
                    )
                }
                .padding(.horizontal)
                
                MovieDetailsGenres(genres: result.genres)
                
                MovieDetailsCompanies(companies: result.productionCompanies)
            }
                .opacity(animate ? 1 : 0.4)
                .animation(.linear(duration: 1.6), value: animate)
                .offset(y: animate ? 0 : 60)
                .animation(.easeOut(duration: 1.1), value: animate)
                .onAppear {
                    animate.toggle()
                }
        }
    }
}

struct MovieDetailsContent_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsContent(movie: MovieModel.dumbInstance().toEntity(), state: .Loading)
    }
}
