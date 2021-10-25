//
//  Failures.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 25/10/21.
//

import Foundation

enum Failures: Error {
    case ServerFailure(error: String)
    case CacheFailure(error: String)
}
