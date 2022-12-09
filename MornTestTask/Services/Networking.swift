//
//  Networking.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 09.12.2022.
//

import Alamofire
import Foundation

struct Networking {
    func fact(_ fetchType: FactType, completion: @escaping (Result<String, Error>) -> Void) {
        fetch(fetchType.path, completion: completion)
    }
    
    private func fetch(_ path: String, completion: @escaping (Result<String, Error>) -> Void) {
        AF.request(path)
            .validate(statusCode: 200..<300)
            .responseString { afString in
                completion(afString.result.mapError { $0 })
            }
    }
}

extension Networking {
    enum FactType {
        case random
        case exact(Int)
        
        fileprivate var path: String {
            switch self {
            case .random: return "http://numbersapi.com/random/math"
            case .exact(let number): return "http://numbersapi.com/\(number)"
            }
        }
    }
}
