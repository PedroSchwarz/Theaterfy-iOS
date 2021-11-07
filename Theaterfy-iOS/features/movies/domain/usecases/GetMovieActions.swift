//
//  GetMovieActions.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import Foundation
import Combine

struct GetMovieActions : UseCase {
    typealias Element = (Bool, Bool)
    typealias Params = GetMovieActionsParams
    
    var repository: MoviesRepository
    
    func execute(params: GetMovieActionsParams) -> AnyPublisher<(Bool, Bool), Failure> {
        return repository.getMovieActions(params.id).eraseToAnyPublisher()
    }
}

struct GetMovieActionsParams {
    var id: Int
}
