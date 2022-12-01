//
//  TouristicList.swift
//  inty
//
//  Created by Creative Ones on 12/1/22.
//

import SwiftUI

struct TouristicList: View {
    @Environment(\.isPresented) var isPresented
    @EnvironmentObject private var appState: AppState
    
    private let destinations: [DestinationItem] = [
        DestinationItem(
            alias: "The Van Abbemuseum",
            description: "Housed in one of the city's most interesting modern buildings, the Van Abbemuseum is one of the most important galleries of modern art in the Netherlands. Highlights of its more than 2,700 artworks include pieces by modern painters such as Marc Chagall and Pablo Picasso. It's also home to the world's largest collection of material by El Lissitzky. Other notable collections include numerous sculptures and art installations, video works, and posters, including a large Paris collection from Jacqueline de Jong, as well as examples from the USA, Germany, and Eastern Europe. A gift shop and café are located on-site.",
            image: "Abbemuseum"
        ),
        DestinationItem(
            alias: "The DAF Museum",
            description: "Eindhoven has been home to DAF, one of Europe's largest truck manufacturers (and, at one time, cars), since the company's founding in 1928. Started by brothers Hub and Wim Van Doorne in a small blacksmith's shop, the company – short for Van Doorne's Aanhangwagen Fabriek – started off making simple engineering products, gradually progressing from trailers to cars and trucks. One of the most popular museums in the southern Netherlands, the DAF Museum is a testament to the company's success and includes a replica of the original workshops and offices, along with samples of its vehicles throughout the decades, including a number of prototypes. A shop and restaurant are located on the premises.",
            image: "DAF_museum"
            
        ),
        DestinationItem(
            alias: "St. Catherine's Church",
            description: "Attractive St. Catherine's Church (St. Catharinakerk) was built in Neo-Gothic style in 1867. The original building – dedicated to St. Catherine of Alexandria – was consecrated in the 13th century and was many times severely damaged by war and fire, even spending part of the 18th-century as a stables and weapons store. Now fully restored, the current structure incorporates a number of symbolic references to the work of Joseph Thijm, one of the country's best-known writers. Highlights include its twin French Gothic towers, each 73 meters tall and known respectively as David and Maria. Interior highlights include its stained-glass windows and its two organs, one of them with 5,723 pipes.",
            image: "Catherine_church"
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

struct TouristicList_Previews: PreviewProvider {
    static var previews: some View {
        TouristicList()
    }
}
