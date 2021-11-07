//
//  CachedMoviesViewModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import Foundation
import Combine

class CachedMoviesViewModel : ObservableObject {
    private var getMoviesByAction: GetMoviesByAction
    
    @Published private(set) var state: CachedMoviesState = .Loading
    
    private var cancellables = Set<AnyCancellable>()
    
    init(getMoviesByAction: GetMoviesByAction) {
        self.getMoviesByAction = getMoviesByAction
    }
    
    func callGetMoviesByAction(_ type: MovieActionType) {
        getMoviesByAction.execute(params: GetMoviesByActionParams(type: type))
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

enum CachedMoviesState {
    case Loading
    case Success(results: [Movie])
    case Failure(error: String)
}
