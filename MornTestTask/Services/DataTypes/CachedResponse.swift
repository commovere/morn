//
//  CachedResponse.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 10.12.2022.
//

import RealmSwift
import Foundation

class CachedResponse: Object, ObjectKeyIdentifiable, FactDataProviding {
    @Persisted(primaryKey: true) var number: String
    @Persisted var details: String
    @Persisted var lastRequestDate: Date

    convenience init(plainData: String) {
        self.init()
        number = plainData.splittedOnce.0
        details = plainData.splittedOnce.1
        lastRequestDate = .init()
    }
}
