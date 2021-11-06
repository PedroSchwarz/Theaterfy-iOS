//
//  PaginationModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 25/10/21.
//

import Foundation

struct PaginationModel<T> : Model where T : Model {
    typealias Element = Pagination
    
    var total_pages: Int
    var results: [T]
    
    func toEntity() -> Element<T> {
        return Pagination(
            totalPages: self.total_pages,
            results: self.results
        )
    }
}
