//
//  Address.swift
//  inty
//
//  Created by Creative Ones on 11/21/22.
//

import SwiftUI

struct Address: View {
    
//    @State private var editMode = EditMode.inactive
    @State private var addMode = false
    @State private var inputText = ""
    
    @AppStorage("address") var address = [
        AddressItem(alias: "First Destination"),
        AddressItem(alias: "Second Destination"),
        AddressItem(alias: "Third Destination"),
    ]
    
    var AddButton: some View {
        Button( addMode ? "Done" : "Add", action: {
            addMode = !addMode                        
            
            if (addMode && !inputText.isEmpty) {
                addItem()
            }
        })
    }
    
    var body: some View {
        NavigationView {
            List {
                
                if (addMode) {
                    Section {
                        TextField("Destination", text: $inputText)
                            .onSubmit(of: .text, {
                                addItem()
                                addMode = false
                            })
                    } header: {
                        Text("Add a destination")
                    }
                }
               
                
                Section {
                    ForEach(address) { addr in
                        Text(addr.alias)
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                } header: {
                    Text("List of available destinations")
                }
            }
            .refreshable {
                address = [
                    AddressItem(alias: "First"),
                    AddressItem(alias: "Second"),
                    AddressItem(alias: "Third"),
                ]
            }
            .toolbar {
                EditButton()
//                AddButton

            }
            
        }
        .navigationBarTitle(Text("Address"))
        .navigationBarItems(trailing: AddButton)
//        .navigationBarItems(trailing: EditButton())
//        .environment(\.editMode, $editMode)
    
    }
    
    private func addItem() {
        address.append(AddressItem(alias: inputText))
        inputText = ""
    }
    
    private func deleteItem(at offsets: IndexSet) {
        address.remove(atOffsets: offsets)
    }
    
    private func moveItem(from source: IndexSet, to destination: Int) {
        address.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct Address_Previews: PreviewProvider {
    static var previews: some View {
        Address()
    }
}
