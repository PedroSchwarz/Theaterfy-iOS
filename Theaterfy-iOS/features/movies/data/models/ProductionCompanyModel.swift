//
//  ProductionCompanyModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation

struct ProductionCompanyModel : Model {
    typealias Element = ProductionCompany
    
    var id: Int
    var name: String
    
    func toEntity() -> ProductionCompany {
        return ProductionCompany(id: self.id, name: self.name)
    }
}
