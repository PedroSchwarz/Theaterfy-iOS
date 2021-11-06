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
    var local: MoviesLocalDataSource
    
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
    
    func getMovieRecommendations(_ id: Int) -> AnyPublisher<[Movie], Failure> {
        return remote.getMovieRecommendations(id)
            .map { result in
                result.map { $0.toEntity() }
            }
            .eraseToAnyPublisher()
    }
    
    func getMovieActions(_ id: Int) -> AnyPublisher<(Bool, Bool), Failure> {
        do {
            let result = try local.getCachedMovie(id)
            if let movie = result {
                return Result.Publisher((movie.watch_later, movie.favorite))
                    .eraseToAnyPublisher()
            } else {
                return Result.Publisher((false, false))
                    .eraseToAnyPublisher()
            }
        } catch {
            return Result.Publisher((false, false))
                .eraseToAnyPublisher()
        }
    }
}
