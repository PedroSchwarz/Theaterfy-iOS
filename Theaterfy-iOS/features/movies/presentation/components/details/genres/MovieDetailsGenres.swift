//
//  MovieDetailsGenres.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 03/11/21.
//

import SwiftUI

struct MovieDetailsGenres: View {
    var genres: [Genre]
    
    var body: some View {
        MovieDetailsList(type: .Genres) {
            ForEach(genres) { item in
                MovieDetailsListCapsule(label: item.name)
                    .padding(.leading, genres.first!.id == item.id ? 16 : 0)
                    .padding(.trailing, genres.last!.id == item.id ? 16 : 0)
            }
        }
        .padding(.top, 10)
    }
}
//
//struct MovieDetailsGenres_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsGenres()
//    }
//}
