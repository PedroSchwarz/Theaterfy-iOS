//
//  MovieDetailsViewModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation
import Combine

class MovieDetailsViewModel : ObservableObject {
    private var getMovieDetails: GetMovieDetails
    
    @Published var state: MovieDetailsState = .Loading
    
    private var cancellables = Set<AnyCancellable>()
    
    init(getMovieDetails: GetMovieDetails) {
        self.getMovieDetails = getMovieDetails
    }
    
    func callGetMovieDetails(_ id: Int) {
        getMovieDetails.execute(params: GetMovieDetailsParams(id: id))
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    self.state = .Failure(error: self.mapFailureToMessage(failure: failure))
                }
            } receiveValue: { self.state = .Success(result: $0) }
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

enum MovieDetailsState {
    case Loading
    case Success(result: MovieDetails)
    case Failure(error: String)
}

