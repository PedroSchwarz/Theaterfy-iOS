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
    private var toggleMovieAction: ToggleMovieAction
    
    @Published var state: MovieDetailsState = .Loading
    @Published var recommendationsState: MovieDetailsRecommendationsState = .Loading
    @Published var watchLater: Bool = false
    @Published var favorite: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        getMovieDetails: GetMovieDetails,
        getMovieRecommendations: GetMovieRecommendations,
        getMovieActions: GetMovieActions,
        toggleMovieAction: ToggleMovieAction
    ) {
        self.getMovieDetails = getMovieDetails
        self.getMovieRecommendations = getMovieRecommendations
        self.getMovieActions = getMovieActions
        self.toggleMovieAction = toggleMovieAction
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
                    self.watchLater = false
                    self.favorite = false
                }
            } receiveValue: { result in
                self.watchLater = result.0
                self.favorite = result.1
            }
            .store(in: &cancellables)
    }
    
    func callToggleMovieAction(movie: Movie, type: MovieActionType) {
        switch type {
        case .FavoriteAction:
            self.favorite.toggle()
        case .WatchLaterAction:
            self.watchLater.toggle()
        }
        
        self.toggleMovieAction.execute(params: ToggleMovieActionParams(movie: movie, type: type))
            .sink { completion in
                switch (completion) {
                case .failure(_):
                    switch type {
                    case .FavoriteAction:
                        self.favorite.toggle()
                    case .WatchLaterAction:
                        self.watchLater.toggle()
                    }
                    break
                case .finished:
                    break
                }
            } receiveValue: { _ in }
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
