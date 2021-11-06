//
//  UseCase.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation
import Combine

protocol UseCase {
    associatedtype Element
    associatedtype Params
    
    func execute(params: Params) -> AnyPublisher<Element, Failure>
}
