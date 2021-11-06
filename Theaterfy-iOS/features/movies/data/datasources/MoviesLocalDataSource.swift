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
}
