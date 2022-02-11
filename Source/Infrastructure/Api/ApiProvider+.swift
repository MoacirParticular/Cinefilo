//
//  ApiProvider+.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 04/02/22.
//

import Foundation

typealias ApiProviderFailureHandler = (ApiError) -> Void

extension ApiProvider {
    func sendRequest<T: Decodable>(to url: String,
                                      with parameters: [AnyHashable: Any],
                                      expecting: T.Type,
                                      completion: @escaping (Result<T, Error>) -> Void) {
    
        self.request(parameters: parameters, finalUrl: url) { result in
            do {
                let result = try result()
                let apiResponse = try JSONDecoder().decode(expecting, from: result.data)
                completion(.success(apiResponse))
                DebugLogger.log(result.data.prettyPrintedJSONString())
            } catch {
                DebugLogger.log(error)
                completion(.failure(error))
            }
            
        }
    }
    
}
