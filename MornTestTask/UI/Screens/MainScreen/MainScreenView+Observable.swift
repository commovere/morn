//
//  MainScreenView+Observable.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 09.12.2022.
//

import Foundation
import RealmSwift

extension MainScreenView {
    class Observable: ObservableObject {
        private let dataProvider = CombinedDataProvider.shared

        @Published var currentNumber: String = .empty
        @Published private(set) var remoteFact: FactDataProviding = EmptyFact()
        @Published var remoteFactIsLoaded: Bool = false
        
        //TODO: make pagination or other lazy loading
        var cached: Results<CachedResponse> { dataProvider.cachedResponses }
        
        func fetchFact(_ number: String?) {
            remoteFact = EmptyFact(number: number)
            dataProvider.fact(for: Int(number ?? .empty)) {[weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let fact):
                    self.remoteFact = fact
                    self.remoteFactIsLoaded = true
                case .failure(let error):
                    //TODO: add error handling - now it is only happy path
                    print(error.localizedDescription)
                }
            }
        }

        func clearState() {
            currentNumber = .empty
            remoteFact = EmptyFact()
            remoteFactIsLoaded = false
        }
    }
}
