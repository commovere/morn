//
//  FactDetailsScreen.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 09.12.2022.
//

import SwiftUI

struct FactDetailsScreen: View {
    @State var fact: FactDataProviding
    
    var body: some View {
        VStack {
            Text(fact.number)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(fact.details)
                .fontWeight(.heavy)
                .font(.body)
                .padding(.horizontal, 10)
        }
    }
}

struct FactDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        FactDetailsScreen(fact: EmptyFact(number: "1234567890"))
    }
}
