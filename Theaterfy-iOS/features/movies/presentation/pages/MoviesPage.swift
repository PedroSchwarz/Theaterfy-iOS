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
        NavigationView {
            VStack {
                switch viewModel.state {
                case .Loading:
                    Spacer()
                    ProgressView()
                    Spacer()
                case .Failure(let error):
                    Spacer()
                    Text(error)
                    Spacer()
                case .Success(let results):
                    List(results) { item in
                        Text(item.title)
                    }
                }
            }
            .navigationTitle("Now Playing")
            .onAppear {
                viewModel.callGetMovies()
            }
        }
    }
}

struct MoviesPage_Previews: PreviewProvider {
    static var previews: some View {
        MoviesPage()
    }
}
