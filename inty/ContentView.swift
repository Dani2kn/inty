//
//  ContentView.swift
//  inty
//
//  Created by Creative Ones on 11/19/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject private var appState: AppState
    @State var isRideShare: Bool = true
    @State var showingAlert: Bool = false
    
    var body: some View {
        
        VStack {
            Navigation()
            
            VStack {
                Toggle(isOn: $isRideShare) {
                    Text("")
                }
                
                Image(systemName: isRideShare ? "externaldrive.badge.person.crop" : "car.front.waves.up")
                    .font(.system(size: 56))
                    .padding()
                
                Button(action: {
                    guard let address = appState.addressItems.first else {
                        showingAlert = true
                        return;
                    }
                    
                    if (isRideShare) {
                        appState.rideShare.append(address)
                    } else {
                        appState.smartCar.append(address)
                    }
                    
                    appState.addressItems.removeFirst()
                }){
                    Text("Travel")
                        .frame(width: 100, height: 100)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                .padding(.bottom, 100.0).buttonStyle(PlainButtonStyle())
            }
            .isHidden(!appState.isContextView , remove: !appState.isContextView)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Alert!"),
                  message: Text("No destinations to travel"),
                  dismissButton: .default(Text("OK")))
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
