//
//  MainScreenView.swift
//  MornTestTask
//
//  Created by Andrii Andreiev on 09.12.2022.
//

import SwiftUI

struct MainScreenView: View {
    @StateObject private var observed = Observable()

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: FactDetailsScreen(fact: observed.remoteFact), isActive: $observed.remoteFactIsLoaded){ EmptyView() }
                    .onAppear{ observed.clearState() }
                HStack {
                    TextField("MainScreen.SearchInput.title", text: $observed.currentNumber)
                        .keyboardType(.numberPad)
                        .font(.title)
                        .padding([.leading, .top])
                        .frame(maxWidth: .infinity)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                    Button("MainScreen.SearchButton.title", action: { observed.fetchFact(observed.currentNumber) })
                        .buttonStyle(PrimaryButtonStyle())
                        .disabled(observed.currentNumber.isEmpty)
                }
                Button("MainScreen.RandomSearchButton.title", action: { observed.fetchFact(nil) })
                    .buttonStyle(PrimaryButtonStyle())
                List(observed.cached.sorted(by: \.lastRequestDate, ascending: false)) { fact in
                    NavigationLink(destination: { FactDetailsScreen(fact: fact)} ) {
                        HistoryListRow(fact: fact)
                    }
                }
                Spacer()
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
