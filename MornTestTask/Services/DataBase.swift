//
//  DataBase.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 10.12.2022.
//

import RealmSwift

class DataBase {
    private let realm = try! Realm()
    
    func fact(for number: Int) -> CachedResponse? {
        realm.object(ofType: CachedResponse.self, forPrimaryKey: String(number))
    }
    
    func save(_ data: CachedResponse, refresh: Bool = false) {
        do {
            try realm.write {
                if refresh { data.lastRequestDate = .init() }
                realm.add(data, update: .all)
            }
        } catch {
            print(error)
        }
    }
    
    lazy var cachedResponses: Results<CachedResponse> = realm.objects(CachedResponse.self)
}
