//
//  GetMoviesRecommendations.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 03/11/21.
//

import Foundation
import Combine

struct GetMovieRecommendations : UseCase {
    typealias Element = [Movie]
    typealias Params = GetMovieRecommendationsParams
    
    var repository: MoviesRepository
    
    func execute(params: GetMovieRecommendationsParams) -> AnyPublisher<[Movie], Failure> {
        return repository.getMovieRecommendations(params.id).eraseToAnyPublisher()
    }
}

struct GetMovieRecommendationsParams {
    var id: Int
}
