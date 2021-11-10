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
    var loadingNextPage: Bool = false
    var onNextPage: (() -> Void)?
    
    var body: some View {
        ScrollView {
            if hasLatest {
                LatestMovieSection(movie: movies.first!)
            }
            
            LazyVStack(alignment: .leading) {
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
                            GeometryReader { geo in
                                MovieItem(movie: item)
                                    .foregroundColor(.primary)
                                    .opacity(MovieItemAnimations.calcOpacity(minY: geo.frame(in: .global).minY))
                                    .offset(y: MovieItemAnimations.calcOffset(minY: geo.frame(in: .global).minY))
                            }
                            .frame(minHeight: 270, maxHeight: 300)
                        }
                    }
                }
                .padding(.vertical, 20)
                
                GeometryReader { geo in
                    if onNextPage != nil && !loadingNextPage && geo.frame(in: .global).minY < CommonProperties.screenHeight - 200 {
                        VStack {}
                        .onAppear {
                            onNextPage!()
                        }
                    }
                    
                    if loadingNextPage {
                        VStack(alignment: .center) {
                            ProgressView()
                        }
                        .frame(width: CommonProperties.screenWidth)
                    }
                }
                .frame(height: 50)
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
