//
//  CachedMoviesPage.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import SwiftUI

struct CachedMoviesPage: View {
    var type: MovieActionType
    @StateObject private var viewModel = AppModules.container.resolve(CachedMoviesViewModel.self)!
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .Loading:
                LoadingProgress()
            case .Failure(let error):
                ErrorMessage(message: error)
            case .Success(let results):
                if results.isEmpty {
                    MoviesEmptyList()
                } else {
                    MoviesGrid(movies: results)
                }
            }
        }
        .navigationTitle(type == .FavoriteAction ? RoutesLocales.favoritesRouteName : RoutesLocales.watchLaterRouteName)
        .onAppear {
            viewModel.callGetMoviesByAction(type)
        }
    }
}

struct CachedMoviesPage_Previews: PreviewProvider {
    static var previews: some View {
        CachedMoviesPage(type: .FavoriteAction)
    }
}
