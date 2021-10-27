//
//  MoviesGrid.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 27/10/21.
//

import SwiftUI

struct MoviesGrid: View {
    var movies: [Movie]
    
    var body: some View {
        LazyVGrid(columns: MoviesProperties.gridLayout) {
            ForEach(self.movies, id: \.id) { item in
                NavigationLink {
//                    MovieDetailsPage(movie: item)
                    Text(item.title)
                } label: {
                    MovieItem(movie: item)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.top, 10)
    }
}

//struct MoviesGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesGrid()
//    }
//}
