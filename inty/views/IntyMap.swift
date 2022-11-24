//
//  IntyMap.swift
//  inty
//
//  Created by Creative Ones on 11/23/22.
//

import SwiftUI
import MapKit

struct IntyMap: View {
    @EnvironmentObject var localSearchService: LocalSearchService
       @State private var search: String = ""
       
       var body: some View {
           VStack {
               
               TextField("Search", text: $search)
                   .textFieldStyle(.roundedBorder)
                   .onSubmit {
                       localSearchService.search(query: search)
                   }.padding()
               
               if localSearchService.landmarks.isEmpty {
                   Text("Delicious places awaits you!")
                       .padding()
                       .overlay(
                               RoundedRectangle(cornerRadius: 16)
                                   .stroke(.gray, lineWidth: 2)
                           )
               } else {
                   LandmarkListView()
               }
               
               Map(coordinateRegion: $localSearchService.region, showsUserLocation: true, annotationItems: localSearchService.landmarks) { landmark in
                   
                   MapAnnotation(coordinate: landmark.coordinate) {
                       Image(systemName: "heart.fill")
                           .foregroundColor(localSearchService.landmark == landmark ? .purple: .red)
                           .scaleEffect(localSearchService.landmark == landmark ? 2: 1)
                   }
                   
               }
               
               Spacer()
           }
       }
}

struct IntyMap_Previews: PreviewProvider {
    static var previews: some View {
        IntyMap().environmentObject(LocalSearchService())
    }
}
