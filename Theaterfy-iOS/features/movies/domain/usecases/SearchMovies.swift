//
//  SearchMovie.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import Foundation
import Combine

struct SearchMovies : UseCase {
    typealias Element = [Movie]
    typealias Params = SearchMoviesParams

    var repository: MoviesRepository

    func execute(params: SearchMoviesParams) -> AnyPublisher<[Movie], Failure> {
        return repository.searchMovies(params.query)
    }
}

struct SearchMoviesParams {
    var query: String
}
