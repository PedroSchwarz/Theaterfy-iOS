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
    private var getMovieRecommendations: GetMovieRecommendations
    private var getMovieActions: GetMovieActions
    
    @Published var state: MovieDetailsState = .Loading
    @Published var recommendationsState: MovieDetailsRecommendationsState = .Loading
    @Published var actionsState: MovieDetailsActionsState = .Done(result: (false, false))
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init(getMovieDetails: GetMovieDetails, getMovieRecommendations: GetMovieRecommendations, getMovieActions: GetMovieActions) {
        self.getMovieDetails = getMovieDetails
        self.getMovieRecommendations = getMovieRecommendations
        self.getMovieActions = getMovieActions
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
        
        getMovieRecommendations.execute(params: GetMovieRecommendationsParams(id: id))
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    self.recommendationsState = .Failure(error: self.mapFailureToMessage(failure: failure))
                }
            } receiveValue: { self.recommendationsState = .Success(result: $0) }
            .store(in: &cancellables)

        getMovieActions.execute(params: GetMovieActionsParams(id: id))
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self.actionsState = .Done(result: (false, false))
                }
            } receiveValue: { result in
                self.actionsState = .Done(result: result)
            }
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

enum MovieDetailsRecommendationsState {
    case Loading
    case Success(result: [Movie])
    case Failure(error: String)
}

enum MovieDetailsActionsState {
    case Done(result: (Bool, Bool))
}
