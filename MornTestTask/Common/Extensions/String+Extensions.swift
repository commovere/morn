//
//  String+Extensions.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 10.12.2022.
//

import Foundation

extension String {
    static let empty = ""

    var splittedOnce: (String, String) {
        let splitted = split(separator: " ", maxSplits: 1, omittingEmptySubsequences: true)
        if splitted.count == 2 {
            return (String(splitted[0]), String(splitted[1]))
        }
        if splitted.count == 1 {
            return (String(splitted[0]), .empty)
        }
        return (.empty, .empty)
    }
}
