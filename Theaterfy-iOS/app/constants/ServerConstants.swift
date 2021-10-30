//
//  ServerConstants.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 25/10/21.
//

import Foundation

struct ServerConstants {
    static let BASE_URL = "https://api.themoviedb.org/3"
    static let API_KEY = "6ca7974eb20d621615c81a17d4234c53"
    
    struct Images {
        static let BASE_PATH = "https://image.tmdb.org/t/p/"
        static let BACKDROP_SIZE = "original"
        static let POSTER_SIZE = "original"
        
        static func buildPathforBackDrop(url: String) -> String {
            "\(ServerConstants.Images.BASE_PATH)\(ServerConstants.Images.BACKDROP_SIZE)\(url)"
        }
        
        static func buildPathforPoster(url: String) -> String {
            "\(ServerConstants.Images.BASE_PATH)\(ServerConstants.Images.POSTER_SIZE)\(url)"
        }
    }
    
    struct GetNowPlaying {
        static let PATH = "/movie/now_playing"
    }
    
    struct GetMovieDetails {
        static let PATH = "/movie/"
    }
    
    static func buildPath(base: String = ServerConstants.BASE_URL, path: String, query: String? = nil) -> String {
        var builtQuery: String = "?api_key=\(ServerConstants.API_KEY)"
        
        if let queries = query {
            builtQuery = "\(builtQuery)\(queries)"
        }
    
        return "\(base)\(path)\(builtQuery)"
    }
}
