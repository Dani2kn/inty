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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onChange(of: isPresented) { newValue in
            print(newValue)
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
