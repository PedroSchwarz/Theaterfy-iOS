//
//  MoviesPage.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import SwiftUI

struct MoviesPage: View {
    @StateObject private var viewModel = AppModules.container.resolve(MoviesViewModel.self)!
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .Loading:
                LoadingProgress()
            case .Failure(let error):
                ErrorMessage(message: error)
            case .Success(let results):
                MoviesGrid(movies: results, hasLatest: true) {
                    viewModel.callGetMovies()
                }
            }
        }
        .navigationTitle(RoutesLocales.nowPlayingRouteName)
        .onAppear {
            viewModel.callGetMovies()
        }
    }
}

struct MoviesPage_Previews: PreviewProvider {
    static var previews: some View {
        MoviesPage()
    }
}
