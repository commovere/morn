//
//  HistoryListRow.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 10.12.2022.
//

import SwiftUI

struct HistoryListRow: View {
    let fact: FactDataProviding
    var body: some View {
        HStack {
            Text(fact.number).bold()
            Text(fact.details)
                .lineLimit(1)
        }
        
    }
}

struct HistoryListRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListRow(fact: EmptyFact(number: "1234567890"))
    }
}
