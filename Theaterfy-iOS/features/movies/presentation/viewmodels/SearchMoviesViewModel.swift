//
//  SearchMoviesViewModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import Foundation
import Combine

class SearchMoviesViewModel : ObservableObject {
    private var searchMovies: SearchMovies
    
    @Published private(set) var state: SearchMoviesState = .Initial
    @Published var query: String = ""
    @Published private(set) var isQueryValid = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(searchMovies: SearchMovies) {
        self.searchMovies = searchMovies
        
        isQueryValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isQueryValid, on: self)
            .store(in: &cancellables)
    }
    
    func callSearchMovies() {
        if !isQueryValid {
            state = .Failure(error: "Search field is empty")
        } else {
            state = .Loading
            
            searchMovies.execute(params: SearchMoviesParams(query: query.urlEncoded()))
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
    }
    
    private var isQueryValidPublisher: AnyPublisher<Bool, Never> {
        $query
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { return !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .eraseToAnyPublisher()
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

enum SearchMoviesState {
    case Initial
    case Loading
    case Success(results: [Movie])
    case Failure(error: String)
}
