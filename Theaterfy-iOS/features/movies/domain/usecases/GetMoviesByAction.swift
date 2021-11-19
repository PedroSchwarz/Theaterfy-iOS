//
//  GetMovieByAction.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import Foundation
import Combine

struct GetMoviesByAction : UseCase {
    typealias Element = [Movie]
    typealias Params = GetMoviesByActionParams
    
    var repository: MoviesRepository
    
    func execute(params: GetMoviesByActionParams) -> AnyPublisher<[Movie], Failure> {
        return repository.getMoviesByAction(params.type)
    }
}

struct GetMoviesByActionParams {
    var type: MovieActionType
}
