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
}