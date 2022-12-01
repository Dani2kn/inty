//
//  Home.swift
//  inty
//
//  Created by Creative Ones on 11/21/22.
//

import SwiftUI

struct Navigation: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geometry in
                
                VStack {
                    
                    HStack {
                        // Tour
                        NavigationLink(destination:
                                        TouristicList()
                            .navigationTitle("Touristic")
                            .onAppear{
                                appState.isContextView = false                                
                            }
                            .navigationBarHidden(appState.listsNavigationBarDisplay),
                                       label: {
                            Spacer()
                            
                            Text("Tour")
                                .foregroundColor(Color.white)
                            
                            Image(systemName: "building.columns.circle")
                                .padding(.trailing)
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: .infinity, maxHeight: geometry.size.width * 0.10)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        .cornerRadius(8)
                        
                        // Social
                        NavigationLink(destination:
                                        SocialList()
                            .navigationTitle("Social")
                            .onAppear{
                                appState.isContextView = false
                            }
                            .navigationBarHidden(appState.listsNavigationBarDisplay),
                                       label: {
                            Spacer()
                            
                            Text("Social")
                                .foregroundColor(Color.white)
                            
                            Image(systemName: "theatermasks.circle")
                                .padding(.trailing)
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: .infinity, maxHeight: geometry.size.width * 0.10)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        .cornerRadius(8)
                        
                        // EAT
                        NavigationLink(destination:
                                        RestaurantList()
                            .navigationTitle("Eat")
                            .onAppear{
                                appState.isContextView = false
                            }
                            .navigationBarHidden(appState.listsNavigationBarDisplay),
                                       label: {
                            Spacer()
                            
                            Text("Eat")
                                .foregroundColor(Color.white)
                            
                            Image(systemName: "fork.knife.circle")
                                .padding(.trailing)
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: .infinity, maxHeight: geometry.size.width * 0.10)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        .cornerRadius(8)
                        
                    }
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: AddressView().navigationTitle("Address").onAppear{
                        appState.isContextView = false
                    }
                                   , label: {
                        HStack {
                            Spacer()
                            
                            Text("Address")
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                            
                            Image(systemName: "note.text.badge.plus")
                                .padding(.trailing)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    })
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.width * 0.15)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: RideSharing().navigationTitle("RideSharing").onAppear{
                        appState.isContextView = false
                    }
                                   , label: {
                        HStack {
                            Spacer()
                            
                            Text("RideSharing")
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                            
                            Image(systemName: "externaldrive.badge.person.crop")
                                .padding(.trailing)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    })
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.width * 0.15)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: SmartCar().navigationTitle("SmartCar").onAppear{
                        appState.isContextView = false
                    }
                                   , label: {
                        HStack {
                            Spacer()
                            
                            Text("SmartCar")
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                            
                            Image(systemName: "car.front.waves.up")
                                .padding(.trailing)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    })
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.width * 0.15)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                    .cornerRadius(8)
                    
                }
                .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                
            }
            
        }
        
    } // body
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
