//
//  Ride.swift
//  inty
//
//  Created by Creative Ones on 11/21/22.
//

import SwiftUI

struct SmartCar: View {
    @Environment(\.isPresented) var isPresented
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(appState.smartCar) { addr in
                        Text(addr.alias)
                    }
                } header: {
                    Text("List of rideshared destinations")
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

struct Ride_Previews: PreviewProvider {
    static var previews: some View {
        SmartCar()
    }
}
