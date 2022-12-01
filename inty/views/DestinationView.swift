//
//  DestinationView.swift
//  inty
//
//  Created by Creative Ones on 12/1/22.
//

import SwiftUI

struct DestinationView: View {
    @EnvironmentObject private var appState: AppState
    @State var showingAlert: Bool = false
    var destinationItem: DestinationItem?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            ScrollView(.vertical) {
                
                Image(destinationItem?.image ?? "")
                
                Text(destinationItem?.description ?? "")
                
                Button("Add to travel address") {
                    let contains = appState.addressItems.contains { item in
                        item.alias == destinationItem?.alias
                    }
                    
                    if !contains {
                        appState.addressItems.append(AddressItem(alias: destinationItem?.alias ?? ""))
                    } else {
                        showingAlert.toggle()
                    }
                }
                .padding(.vertical)
            }
            .padding(.all)
            
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Alert!"),
                  message: Text("Already in address"),
                  dismissButton: .default(Text("OK")))
        }
        .padding(.horizontal)
        
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView()
    }
}
