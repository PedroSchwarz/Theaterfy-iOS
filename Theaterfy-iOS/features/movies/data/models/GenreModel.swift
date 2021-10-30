//
//  GenreModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation

struct GenreModel : Model {
    typealias Element = Genre
    
    var id: Int
    var name: String
    
    func toEntity() -> Genre {
        return Genre(id: self.id, name: self.name)
    }
}
