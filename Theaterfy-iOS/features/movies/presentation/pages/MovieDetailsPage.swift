//
//  MovieDetailsPage.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct MovieDetailsPage: View {
    var movie: Movie
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text(movie.title)
            }
        }
    }
}

struct MovieDetailsPage_Previews: PreviewProvider {
    static let movie = MovieModel.dumbInstance().toEntity()
    
    static var previews: some View {
        MovieDetailsPage(movie: movie)
    }
}
