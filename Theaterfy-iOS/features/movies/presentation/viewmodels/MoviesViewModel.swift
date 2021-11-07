//
//  MoviesViewModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation
import Combine

class MoviesViewModel : ObservableObject {
    private var getMovies: GetMovies
    
    @Published private(set) var state: MoviesState = .Loading
    
    private var cancellables = Set<AnyCancellable>()
    
    init(getMovies: GetMovies) {
        self.getMovies = getMovies
    }
    
    func callGetMovies() {
        getMovies.execute(params: GetMoviesParams(page: 1))
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    self.state = .Failure(error: self.mapFailureToMessage(failure: failure))
                }
            } receiveValue: { self.state = .Success(results: $0) }
            .store(in: &cancellables)
    }
    
    func mapFailureToMessage(failure: Failure) -> String {
        switch (failure) {
        case .ServerFailure(let message):
            return message
        case .CacheFailure(let message):
            return message
        }
    }
}

enum MoviesState {
    case Loading
    case Success(results: [Movie])
    case Failure(error: String)
}
