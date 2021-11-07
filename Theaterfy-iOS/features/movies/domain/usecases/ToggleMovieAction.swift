//
//  ToggleMovieAction.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import Foundation
import Combine

struct ToggleMovieAction : UseCase {
    typealias Element = Void
    typealias Params = ToggleMovieActionParams
    
    var repository: MoviesRepository
    
    func execute(params: ToggleMovieActionParams) -> AnyPublisher<Void, Failure> {
        return repository.toggleMovieAction(movie: params.movie, type: params.type)
            .eraseToAnyPublisher()
    }
}

struct ToggleMovieActionParams {
    var movie: Movie
    var type: MovieActionType
}
