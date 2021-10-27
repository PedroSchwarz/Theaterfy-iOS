//
//  MovieModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 25/10/21.
//

import Foundation

struct MovieModel : Model {
    typealias Element = Movie
    
    var id: Int
    var adult: Bool
    var backdrop_path: String?
    var original_title: String
    var overview: String
    var poster_path: String?
    var release_date: String
    var title: String
    var vote_average: Double
    var vote_count: Int
    
    func toEntity() -> Movie {
        return Movie(
            id: self.id,
            adult: self.adult,
            backdropUrl: self.backdrop_path != nil ? ServerConstants.Images.buildPathforBackDrop(url: self.backdrop_path!) : nil,
            originalTitle: self.original_title,
            overview: self.overview,
            posterUrl: self.poster_path != nil ? ServerConstants.Images.buildPathforPoster(url: self.poster_path!) : nil,
            releaseDate: self.release_date,
            title: self.title,
            voteAverage: self.vote_average,
            voteCount: self.vote_count,
            watchLater: false,
            favorite: false
        )
    }
    
    static func dumbInstance() -> MovieModel {
        return MovieModel(
            id: 1,
            adult: false,
            backdrop_path: nil,
            original_title: "Movie 1",
            overview: "Movie 1",
            poster_path: nil,
            release_date: "2020-01-01",
            title: "Movie 1",
            vote_average: 7.5,
            vote_count: 900
        )
    }
}
