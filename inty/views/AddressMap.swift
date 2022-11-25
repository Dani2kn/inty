//
//  AddressMap.swift
//  inty
//
//  Created by Creative Ones on 11/25/22.
//

import SwiftUI
import MapKit

struct AddressMap: View {
    @EnvironmentObject private var appState: AppState
    @StateObject private var mapAPI = MapAPI()
    @State private var addr = ""
    
    var body: some View {
        VStack {
            
            TextField("Enter an address", text: $addr)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            HStack {
                Button("Add address") {
                    appState.addressItems.append(AddressItem(alias: addr))
                    addr = ""
                }
                
                Spacer()
                
                Button("Find address") {
                    mapAPI.getLocation(address: addr, delta: 0.5)
                }
            }
            .padding([.leading, .trailing])
            
            
            Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations) { location in
                MapMarker(coordinate: location.coordinate, tint: .blue)
            }
            .ignoresSafeArea()
        }
    }
}

struct AddressMap_Previews: PreviewProvider {
    static var previews: some View {
        AddressMap()
    }
}
