//
//  CombinedDataProvider.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 10.12.2022.
//

import Foundation
import RealmSwift

class CombinedDataProvider {
    static let shared = CombinedDataProvider()
    
    private let remote = Networking()
    private let local = DataBase()
    private init(){}
    
    
    var cachedResponses: Results<CachedResponse> { local.cachedResponses }
    
    func fact(for number: Int?, completion: @escaping (Result<FactDataProviding, Error>) -> Void) {
        guard let number = number else {
            remote.fact(.random, completion: { completion( self.handleFetch($0)) })
            return
        }
        guard let factData = local.fact(for: number) else {
            remote.fact(.exact(number), completion: { completion( self.handleFetch($0)) })
            return
        }
        completion(.success(factData))
        local.save(factData, refresh: true)
    }
    
    private func handleFetch(_ result: Result<String, Error>) -> Result<FactDataProviding, Error> {
        switch result {
        case .failure(let error): return .failure(error)
        case .success(let data):
            let response = CachedResponse(plainData: data)
            local.save(response)
            return .success(response)
        }
    }
}
