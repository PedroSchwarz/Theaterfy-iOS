//
//  MoviesLocalDataSource.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import Foundation
import CoreData

protocol MoviesLocalDataSource {
    func getCachedMovie(_ id: Int) throws -> MovieCore?
    func toggleMovieAction(movie: Movie, type: MovieActionType) throws -> Void
    func getMoviesByAction(_ type: MovieActionType) throws -> [MovieCore]?
}

struct MoviesLocalDataSourceImpl : MoviesLocalDataSource {
    var viewContext: NSManagedObjectContext
    
    func getCachedMovie(_ id: Int) throws -> MovieCore? {
        let request: NSFetchRequest<MovieCore> = MovieCore.fetchRequest()
        let filter = NSPredicate(format: "id = %d", id)
        request.predicate = filter
        
        do {
            let results: [MovieCore] = try viewContext.fetch(request)
            return results.first
        } catch {
            throw Failure.CacheFailure(error: error.localizedDescription)
        }
    }
    
    func toggleMovieAction(movie: Movie, type: MovieActionType) throws {
        let request: NSFetchRequest<MovieCore> = MovieCore.fetchRequest()
        let filter = NSPredicate(format: "id = %d", movie.id)
        request.predicate = filter
        
        do {
            let results: [MovieCore] = try viewContext.fetch(request)
            if let movie = results.first {
                switch(type) {
                case .WatchLaterAction:
                    movie.watch_later.toggle()
                    break
                case .FavoriteAction:
                    movie.favorite.toggle()
                    break
                }
                
                try self.viewContext.save()
                return
            } else {
                let newMovie = MovieCore(context: self.viewContext)
                MovieCoreData.fromEntity(movie: movie, movieCore: newMovie, type: type)
                
                try self.viewContext.save()
            }
        } catch {
            throw Failure.CacheFailure(error: error.localizedDescription)
        }
    }
    
    func getMoviesByAction(_ type: MovieActionType) throws -> [MovieCore]? {
        let request: NSFetchRequest<MovieCore> = MovieCore.fetchRequest()
        let filter = type == .FavoriteAction ? "favorite == YES" : "watch_later == YES"
        let predicate = NSPredicate(format: filter)
        request.predicate = predicate
        
        do {
            let results: [MovieCore] = try viewContext.fetch(request)
            return results
        } catch {
            throw Failure.CacheFailure(error: error.localizedDescription)
        }
    }
}
