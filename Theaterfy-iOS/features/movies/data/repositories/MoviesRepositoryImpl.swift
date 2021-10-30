//
//  MovieRepositoryImpl.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation
import Combine

struct MoviesRepositoryImpl : MoviesRepository {
    var remote: MoviesRemoteDataSource
    
    func getMovies(_ page: Int) -> AnyPublisher<[Movie], Failure> {
        return remote.getMovies(page)
            .map { result in
                result.map { $0.toEntity() }
            }
            .eraseToAnyPublisher()
    }
    
    func getMovieDetails(_ id: Int) -> AnyPublisher<MovieDetails, Failure> {
        return remote.getMovieDetails(id)
            .map({ $0.toEntity() })
            .eraseToAnyPublisher()
    }
}
