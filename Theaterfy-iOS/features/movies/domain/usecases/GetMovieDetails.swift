//
//  GetMovieDetails.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation
import Combine

struct GetMovieDetails : UseCase {
    typealias Element = MovieDetails
    typealias Params = GetMovieDetailsParams
    
    var repository: MoviesRepository
    
    func execute(params: GetMovieDetailsParams) -> AnyPublisher<MovieDetails, Failure> {
        return repository.getMovieDetails(params.id).eraseToAnyPublisher()
    }
}

struct GetMovieDetailsParams {
    var id: Int
}
