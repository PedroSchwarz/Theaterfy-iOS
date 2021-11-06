//
//  Model.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation

protocol Model : Codable {
    associatedtype Element
    
    func toEntity() -> Element
}
