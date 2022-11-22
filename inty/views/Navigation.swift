//
//  Home.swift
//  inty
//
//  Created by Creative Ones on 11/21/22.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geometry in
                
                VStack {
                    
                    NavigationLink(destination: Address().navigationTitle("Address"), label: {
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
                    .padding(.bottom, 60)
                    
                    NavigationLink(destination: RideSharing().navigationTitle("RideSharing"), label: {
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
                    .padding(.bottom, 60)
                    
                    NavigationLink(destination: SmartCar().navigationTitle("SmartCar"), label: {
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
                .padding(.top, 60)
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
