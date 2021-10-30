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
            }
        }
    }
}

struct MovieDetailsContent_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsContent(movie: MovieModel.dumbInstance().toEntity(), state: .Loading)
    }
}
