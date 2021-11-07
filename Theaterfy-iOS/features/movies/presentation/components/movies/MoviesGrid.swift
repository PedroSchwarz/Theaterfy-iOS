//
//  MoviesGrid.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 27/10/21.
//

import SwiftUI

struct MoviesGrid: View {
    var movies: [Movie]
    var hasLatest: Bool = false
    
    var body: some View {
        ScrollView {
            if hasLatest {
                LatestMovieSection(movie: movies.first!)
            }
            
            VStack(alignment: .leading) {
                if hasLatest {
                    Text(MoviesLocales.nowOnTheaters)
                        .font(.title)
                        .bold()
                        .foregroundColor(CommonColors.SteelBlueColor)
                        .padding(.horizontal)
                }
                
                LazyVGrid(columns: MoviesProperties.gridLayout) {
                    ForEach(hasLatest ? Array(movies.dropFirst()) : movies, id: \.id) { item in
                        NavigationLink {
                            MovieDetailsPage(movie: item)
                        } label: {
                            MovieItem(movie: item)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding(.vertical, 20)
            }
            .padding(.top, 30)
        }
    }
}

struct MoviesGrid_Previews: PreviewProvider {
    static var previews: some View {
        MoviesGrid(movies: [MovieModel.dumbInstance().toEntity()])
    }
}
