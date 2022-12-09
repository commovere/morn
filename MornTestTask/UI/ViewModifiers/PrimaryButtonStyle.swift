//
//  PrimaryButtonStyle.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 09.12.2022.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
            .padding(.horizontal)
        
    }
}
