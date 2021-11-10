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
    @Published private(set) var isLoadingNextPage: Bool = false
    @Published private var currentPage: Int = 1
    @Published private var movies: [Movie] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(getMovies: GetMovies) {
        self.getMovies = getMovies
    }
    
    func callGetMovies(isNextPage: Bool = false) {
        if !isNextPage {
            state = .Loading
        }
        
        getMovies.execute(params: GetMoviesParams(page: currentPage))
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    if !isNextPage {
                        self.state = .Failure(error: self.mapFailureToMessage(failure: failure))
                    }
                }
            } receiveValue: {
                self.movies.append(contentsOf: $0)
                self.state = .Success(results: self.movies)
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
    
    func loadNextPage() {
        isLoadingNextPage = true
        
        currentPage = currentPage + 1
        
        callGetMovies(isNextPage: true)
        
        isLoadingNextPage = false
    }
}

enum MoviesState {
    case Loading
    case Success(results: [Movie])
    case Failure(error: String)
}
