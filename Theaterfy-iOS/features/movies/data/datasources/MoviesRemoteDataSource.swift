//
//  MoviesRemoteDataSource.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation
import Combine

protocol MoviesRemoteDataSource {
    func getMovies(_ page: Int) -> AnyPublisher<[MovieModel], Failure>
    func getMovieDetails(_ id: Int) -> AnyPublisher<MovieDetailsModel, Failure>
    func getMovieRecommendations(_ id: Int) -> AnyPublisher<[MovieModel], Failure>
}

struct MoviesRemoteDataSourceImpl : MoviesRemoteDataSource {
    var server: Server
    
    func getMovies(_ page: Int) -> AnyPublisher<[MovieModel], Failure> {
        return server.execute(
            path: ServerConstants.buildPath(path: ServerConstants.GetNowPlaying.PATH, query: "&page=\(page)"),
            decodable: PaginationModel<MovieModel>.self
        )
            .map({ result in
                result.results
            })
            .eraseToAnyPublisher()
    }
    
    func getMovieDetails(_ id: Int) -> AnyPublisher<MovieDetailsModel, Failure> {
        return server.execute(
            path: ServerConstants.buildPath(path: "\(ServerConstants.GetMovieDetails.PATH)\(id)"),
            decodable: MovieDetailsModel.self
        )
            .eraseToAnyPublisher()
    }
    
    func getMovieRecommendations(_ id: Int) -> AnyPublisher<[MovieModel], Failure> {
        return server.execute(
            path: ServerConstants.buildPath(path:"\(ServerConstants.GetMovieDetails.PATH)\(id)\(ServerConstants.GetMovieRecommendations.PATH)"),
            decodable: PaginationModel<MovieModel>.self
        )
            .map({ result in
                result.results
            })
            .eraseToAnyPublisher()
    }
}
