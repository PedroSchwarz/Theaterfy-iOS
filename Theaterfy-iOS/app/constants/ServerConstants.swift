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
    
    struct GetNowPlaying {
        static let PATH = "/movie/now_playing"
    }
    
    static func buildPath(base: String = ServerConstants.BASE_URL, path: String, queryStrings: [String]? = nil) -> String {
        var builtQuery: String = "?api_key=\(ServerConstants.API_KEY)"
        
        if let queries = queryStrings {
            queries.forEach { query in
               builtQuery += "\(query)\(queries.last != query ? "&" :  "")"
           }
        }
        
        print("\(base)\(path)\(builtQuery)")
        return "\(base)\(path)\(builtQuery)"
    }
}
