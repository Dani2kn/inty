//
//  RestaurantView.swift
//  inty
//
//  Created by Creative Ones on 12/1/22.
//

import SwiftUI

struct RestaurantList: View {
    @Environment(\.isPresented) var isPresented
    @EnvironmentObject private var appState: AppState
    
    private let destinations: [DestinationItem] = [
        DestinationItem(
            alias: "Restaurant De Luytervelde",
            description: "(French, Dutch, Seafood, European)",
            image: "Luytervelde"
        ),
        DestinationItem(
            alias: "Dyke9",
            description: "(French, European, International)",
            image: "Dyke9"
        ),
        DestinationItem(
            alias: "1910",
            description: "(Dutch, Seafood, European, International)",
            image: "1910_rest"
        )
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(destinations) { dest in
                        NavigationLink( destination: DestinationView(destinationItem: dest)
                            .navigationBarTitle(Text(dest.alias), displayMode: .automatic)) {
                            Text(dest.alias)
                        }.isDetailLink(false)
                    }
                } header: {
                    Text("List of Touristic destinations")
                }
            }
        }               
        .onChange(of: isPresented) { newValue in
            if !newValue {
                appState.isContextView = true
            }
        }
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList()
    }
}
