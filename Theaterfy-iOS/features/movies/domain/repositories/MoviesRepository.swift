//
//  MoviesRepository.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation
import Combine

protocol MoviesRepository {
    func getMovies(_ page: Int) -> AnyPublisher<[Movie], Failure>
    func getMovieDetails(_ id: Int) -> AnyPublisher<MovieDetails, Failure>
    func getMovieRecommendations(_ id: Int) -> AnyPublisher<[Movie], Failure>
    func getMovieActions(_ id: Int) -> AnyPublisher<(Bool, Bool), Failure>
    func toggleMovieAction(movie: Movie, type: MovieActionType) -> AnyPublisher<Void, Failure>
    func getMoviesByAction(_ type: MovieActionType) -> AnyPublisher<[Movie], Failure>
    func searchMovies(_ query: String) -> AnyPublisher<[Movie], Failure>
}
