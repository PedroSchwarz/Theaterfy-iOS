//
//  SearchMoviesPage.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import SwiftUI

struct SearchMoviesPage: View {
    @StateObject private var viewModel = AppModules.container.resolve(SearchMoviesViewModel.self)!
    @State var test: String = ""
    
    var body: some View {
        VStack {
            SearchBar(query: $viewModel.query) {
                viewModel.callSearchMovies()
            }
            
            switch viewModel.state {
            case .Initial:
                EmptyView()
            case .Loading:
                LoadingProgress()
            case .Failure(let error):
                ErrorMessage(message: error)
            case .Success(let results):
                MoviesGrid(movies: results)
            }
        }
        .navigationTitle(RoutesLocales.searchRouteName)
    }
}

struct SearchMoviesPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchMoviesPage()
    }
}
