//
//  AppModules.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation
import Swinject
import CoreData

struct AppModules {
    static let container = Container()
    
    static func initContainer() {
        // Externals
        container.register(Server.self) { _ in Server() }
        container.register(NSManagedObjectContext.self) { _ in PersistenceController.shared.container.viewContext }
        
        // DataSources
        container.register(MoviesRemoteDataSource.self) { r in MoviesRemoteDataSourceImpl(server: r.resolve(Server.self)!) }
        container.register(MoviesLocalDataSource.self) { r in MoviesLocalDataSourceImpl(viewContext: r.resolve(NSManagedObjectContext.self)!) }
        
        // Repositories
        container.register(MoviesRepository.self) { r in
            MoviesRepositoryImpl(
                remote: r.resolve(MoviesRemoteDataSource.self)!,
                local: r.resolve(MoviesLocalDataSource.self)!
            )
        }
        
        // UseCases
        container.register(GetMovies.self) { r in GetMovies(repository: r.resolve(MoviesRepository.self)!) }
        container.register(GetMovieDetails.self) { r in GetMovieDetails(repository: r.resolve(MoviesRepository.self)!) }
        container.register(GetMovieRecommendations.self) { r in
            GetMovieRecommendations(repository: r.resolve(MoviesRepository.self)!)
        }
        container.register(GetMovieActions.self) { r in GetMovieActions(repository: r.resolve(MoviesRepository.self)!) }
        container.register(ToggleMovieAction.self) { r in ToggleMovieAction(repository: r.resolve(MoviesRepository.self)!) }
        container.register(GetMoviesByAction.self) { r in GetMoviesByAction(repository: r.resolve(MoviesRepository.self)!) }
        container.register(SearchMovies.self) { r in SearchMovies(repository: r.resolve(MoviesRepository.self)!) }
        
        // ViewModels
        container.register(MoviesViewModel.self) { r in MoviesViewModel(getMovies: r.resolve(GetMovies.self)!) }
        container.register(MovieDetailsViewModel.self) { r in
            MovieDetailsViewModel(
                getMovieDetails: r.resolve(GetMovieDetails.self)!,
                getMovieRecommendations: r.resolve(GetMovieRecommendations.self)!,
                getMovieActions: r.resolve(GetMovieActions.self)!,
                toggleMovieAction: r.resolve(ToggleMovieAction.self)!
            )
        }
        container.register(CachedMoviesViewModel.self) { r in
            CachedMoviesViewModel(
                getMoviesByAction: r.resolve(GetMoviesByAction.self)!
            )
        }
        container.register(SearchMoviesViewModel.self) { r in
            SearchMoviesViewModel(searchMovies: r.resolve(SearchMovies.self)!)
        }
        container.register(TabViewModel.self) { _ in TabViewModel() }
    }
}
