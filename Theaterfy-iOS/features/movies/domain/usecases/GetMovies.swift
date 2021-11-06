//
//  GetMovie.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation
import Combine

struct GetMovies : UseCase {
    typealias Element = [Movie]
    typealias Params = GetMoviesParams
    
    var repository: MoviesRepository
    
    func execute(params: GetMoviesParams) -> AnyPublisher<[Movie], Failure> {
        return repository.getMovies(params.page).eraseToAnyPublisher()
    }
}

struct GetMoviesParams {
    var page: Int
}
