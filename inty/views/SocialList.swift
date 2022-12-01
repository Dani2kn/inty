//
//  SocialView.swift
//  inty
//
//  Created by Creative Ones on 12/1/22.
//

import SwiftUI

struct SocialList: View {
    @Environment(\.isPresented) var isPresented
    @EnvironmentObject private var appState: AppState
    
    private let destinations: [DestinationItem] = [
        DestinationItem(
            alias: "Wrap up the Year in Eindhoven",
            description: "The end of 2022 is in sight. From delicious Christmas menus to spectacular party outfits, with our tips you can close the year in style!",
            image: "wrap_year"
        ),
        DestinationItem(
            alias: "Candlelight Concert Eindhoven",
            description: "At various places in the city you can enjoy a magical performance with lots of candlelight. This evening in LAB-1 is dedicated to Vivaldi's Four Seasons.",
            image: "candlelight"
        ),
        DestinationItem(
            alias: "Bell's Comedy Club",
            description: "Time to train the laughing muscles! Bell's Comedy Club is back with an English-language night of fun!",
            image: "Bell_comedy"
        ),
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

struct SocialList_Previews: PreviewProvider {
    static var previews: some View {
        SocialList()
    }
}
