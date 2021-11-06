//
//  MovieCoreData.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import Foundation

struct MovieCoreData {
    static func toEntity(movieCore: MovieCore) -> Movie {
        return Movie(
            id: Int(movieCore.id),
            adult: movieCore.adult,
            backdropUrl: movieCore.backdrop_url!,
            originalTitle: movieCore.original_title!,
            overview: movieCore.overview!,
            posterUrl: movieCore.poster_url!,
            releaseDate: movieCore.release_date!,
            title: movieCore.title!,
            voteAverage: movieCore.vote_average,
            voteCount: Int(movieCore.vote_count),
            watchLater: movieCore.watch_later,
            favorite: movieCore.favorite
        )
    }
    
    static func fromEntity(movie: Movie, movieCore: MovieCore, type: MovieActionType) {
        movieCore.id = Int32(movie.id)
        movieCore.original_title = movie.originalTitle
        movieCore.title = movie.title
        movieCore.favorite = type == .FavoriteAction
        movieCore.watch_later = type == .WatchLaterAction
        movieCore.adult = movie.adult
        movieCore.overview = movie.overview
        movieCore.backdrop_url = movie.backdropUrl
        movieCore.release_date = movie.releaseDate
        movieCore.poster_url = movie.posterUrl
        movieCore.vote_average = movie.voteAverage
        movieCore.vote_count = Int32(movie.voteCount)
    }
}
