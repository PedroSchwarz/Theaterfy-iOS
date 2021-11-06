//
//  Movie.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation

struct Movie : Identifiable {
    var id: Int
    var adult: Bool
    var backdropUrl: String?
    var originalTitle: String
    var overview: String
    var posterUrl: String?
    var releaseDate: String
    var title: String
    var voteAverage: Double
    var voteCount: Int
    var watchLater: Bool
    var favorite: Bool
}
