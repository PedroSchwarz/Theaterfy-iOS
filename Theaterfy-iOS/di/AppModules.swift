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
        
        // Repositories
        container.register(MoviesRepository.self) { r in MoviesRepositoryImpl(remote: r.resolve(MoviesRemoteDataSource.self)!) }
        
        // UseCases
        container.register(GetMovies.self) { r in GetMovies(repository: r.resolve(MoviesRepository.self)!) }
        
        // ViewModels
        container.register(MoviesViewModel.self) { r in MoviesViewModel(getMovies: r.resolve(GetMovies.self)!) }
    }
}
