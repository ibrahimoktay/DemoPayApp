//
//  Service.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import Foundation

enum APIError: Error {
    case noData
    case parsing
}

extension APIError {
    
    var message: String {
        switch self {
        case .noData:
            return "Data not found"
        case .parsing:
            return "Data could not be parsed."
        default:
            return "Unknown Error"
        }
    }
}

func call<T: Decodable>(_ request: URLRequest, _ completion: @escaping (Result<T, APIError>) -> Void) {
    let urlSession = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let data = data {
            if let object = try? JSONDecoder().decode(T.self, from: data) {
                DispatchQueue.main.async {
                    // update our UI
                    completion(.success(object))
                }
                
            } else {
                completion(.failure(.parsing))
            }
        } else {
            completion(.failure(.noData))
        }
    }
    
    urlSession.resume()
}
