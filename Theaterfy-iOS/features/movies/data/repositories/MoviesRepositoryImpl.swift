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
    
    func toggleMovieAction(movie: Movie, type: MovieActionType) -> AnyPublisher<Void, Failure> {
        do {
            try local.toggleMovieAction(movie: movie, type: type)
            return Result.Publisher(()).eraseToAnyPublisher()
        } catch let error as Failure {
            return Result.Publisher(error).eraseToAnyPublisher()
        } catch {
            return Result.Publisher(Failure.CacheFailure(error: error.localizedDescription))
                .eraseToAnyPublisher()
        }
    }
    
    func getMoviesByAction(_ type: MovieActionType) -> AnyPublisher<[Movie], Failure> {
        do {
            let results = try local.getMoviesByAction(type)
            if let localMovies = results {
                let movies = localMovies.map { MovieCoreData.toEntity(movieCore: $0) }
                return Result.Publisher(movies)
                    .eraseToAnyPublisher()
            } else {
                return Result.Publisher([])
                    .eraseToAnyPublisher()
            }
        } catch let error as Failure {
            return Result.Publisher(error).eraseToAnyPublisher()
        } catch {
            return Result.Publisher(Failure.CacheFailure(error: error.localizedDescription))
                .eraseToAnyPublisher()
        }
    }
    
    func searchMovies(_ query: String) -> AnyPublisher<[Movie], Failure> {
        return remote.searchMovies(query)
            .map { result in
                result.map { $0.toEntity() }
            }
            .eraseToAnyPublisher()
    }
}
