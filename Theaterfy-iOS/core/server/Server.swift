//
//  Server.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 26/10/21.
//

import Foundation
import Alamofire
import Combine

enum Method {
    case GET
}

struct Server {
    func execute<T>(path: String) -> AnyPublisher<T, Failure>  where T : Codable {
        return AF.request(path)
            .publishDecodable(type: T.self, queue: .main, decoder: JSONDecoder())
            .tryMap { response in
                switch response.result {
                case .success(let value):
                    return value
                case .failure(let error):
                    throw AFError.createURLRequestFailed(error: error)
                }
            }
            .mapError({
                error in
                return Failure.ServerFailure(error: error.localizedDescription)
                
            })
            .eraseToAnyPublisher()
    }
}
