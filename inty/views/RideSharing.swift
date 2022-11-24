//
//  RideSharing.swift
//  inty
//
//  Created by Creative Ones on 11/21/22.
//

import SwiftUI

struct RideSharing: View {
    @Environment(\.isPresented) var isPresented
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(appState.rideShare) { addr in
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

struct RideSharing_Previews: PreviewProvider {
    static var previews: some View {
        RideSharing()
    }
}
