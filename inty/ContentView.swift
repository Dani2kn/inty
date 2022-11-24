//
//  ContentView.swift
//  inty
//
//  Created by Creative Ones on 11/19/22.
//

import AlertToast
import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject private var appState: AppState
    @State var isRideShare: Bool = true
    @State var showingAlert: Bool = false
    @State private var showToast = false
    @State private var toastMessage = ""
    
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
                        toastMessage = "Destination sent to Ride Sharing!"
                    } else {
                        toastMessage = "Destination sent to your Smart Car!"
                        appState.smartCar.append(address)
                    }
                    
                    appState.addressItems.removeFirst()
                    showToast.toggle()
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
        .toast(isPresenting: $showToast) {
            AlertToast(type: .regular, title: "\(toastMessage)")
        }
        
    }
    
    func createTopToastView() -> some View {
            VStack {
                Spacer(minLength: 20)
                HStack() {
                    Image("mike")
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)

                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text("Mike")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Spacer()
                            Text("10:10")
                                .font(.system(size: 12))
                                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                        }

                        Text("Hey, Don't miss the WWDC on tonight at 10 AM PST.")
                            .lineLimit(2)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                }.padding(15)
            }
            .frame(width: UIScreen.main.bounds.width, height: 110)
            .background(Color(red: 0.85, green: 0.65, blue: 0.56))
        }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
