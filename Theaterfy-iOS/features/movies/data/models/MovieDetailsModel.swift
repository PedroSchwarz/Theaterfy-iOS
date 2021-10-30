//
//  MovieDetailsModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation

struct MovieDetailsModel : Model {
    typealias Element = MovieDetails
    
    var budget: Int
    var genres: [GenreModel]
    var homepage: String?
    var production_companies: [ProductionCompanyModel]
    var revenue: Int
    var runtime: Int?
    
    func toEntity() -> MovieDetails {
        let genres = self.genres.map { $0.toEntity() }
        let companies = self.production_companies.map { $0.toEntity() }
        
        return MovieDetails(
            budget: formatCurrency(amount: self.budget),
            genres: genres,
            homepage: self.homepage,
            productionCompanies: companies,
            revenue: formatCurrency(amount: self.revenue),
            runtime: minutesToHours(runtime: 0),
            profit: formatCurrency(amount: self.revenue - self.budget)
        )
    }
    
    static func dumbInstance() -> MovieDetailsModel {
        return MovieDetailsModel(
            budget: 100000000,
            genres: [GenreModel(id: 1, name: "Action")],
            homepage: "",
            production_companies: [ProductionCompanyModel(id: 1, name: "Marvel")],
            revenue: 10000000,
            runtime: 120
        )
    }
}
