//
//  MoviesProperties.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 27/10/21.
//

import Foundation
import SwiftUI

struct MoviesProperties {
    static let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
}

enum MovieActionType {
    case FavoriteAction
    case WatchLaterAction
}
