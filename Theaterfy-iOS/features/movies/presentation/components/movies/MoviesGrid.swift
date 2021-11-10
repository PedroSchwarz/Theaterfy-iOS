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
    var onRefresh: (() -> Void)?
    @State private var refreshing: Bool = false
    
    var body: some View {
        ScrollView {
            if hasLatest {
                GeometryReader { geo in
                    if (geo.frame(in: .global).minY > 350 || refreshing) && onRefresh != nil {
                        MoviesRefreshList {
                            refreshing = true
                            onRefresh!()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                refreshing = false
                            }
                        }
                    }
                    
                    LatestMovieSection(movie: movies.first!)
                        .padding(.vertical, (onRefresh != nil && refreshing) ? 50 : 0)
                        .animation(.linear(duration: 0.4), value: refreshing)
                }
                .frame(height: 380)
                .padding(.bottom, (onRefresh != nil && refreshing) ? 50 : 0)
                .animation(.linear(duration: 0.8), value: refreshing)
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
        MoviesGrid(movies: [MovieModel.dumbInstance().toEntity()]) {
            print("Refreshing")
        }
    }
}
