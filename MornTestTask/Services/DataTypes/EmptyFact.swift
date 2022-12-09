//
//  EmptyFact.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 10.12.2022.
//

import Foundation

struct EmptyFact: FactDataProviding {
    let number: String
    let details: String = "..."
    init(number: String? = nil) {
        self.number = number ?? "..."
    }
}
