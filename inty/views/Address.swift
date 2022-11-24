//
//  Address.swift
//  inty
//
//  Created by Creative Ones on 11/21/22.
//

import SwiftUI

struct Address: View {
    
//    @State private var editMode = EditMode.inactive
    @EnvironmentObject private var appState: AppState
    @Environment(\.isPresented) var isPresented
    @State var needRefresh: Bool = false
    @State private var addMode = false
    @State private var inputText = ""
    
    var AddButton: some View {
        Button( addMode ? "Done" : "Add", action: {
            if (addMode && !inputText.isEmpty) {
                addItem()
            }
            
            addMode.toggle()
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
                    ForEach(appState.addressItems) { addr in
                        Text(addr.alias)
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                } header: {
                    Text("List of available destinations")
                }
            }
            .refreshable {
                appState.addressItems = [
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
        .onChange(of: isPresented) { newValue in            
            if !newValue {
                appState.isContextView = true
            }
        }
//        .navigationBarItems(trailing: EditButton())
//        .environment(\.editMode, $editMode)
    
    }
    
    private func addItem() {
        appState.addressItems.append(AddressItem(alias: inputText))
        inputText = ""
    }
    
    private func deleteItem(at offsets: IndexSet) {
        appState.addressItems.remove(atOffsets: offsets)
    }
    
    private func moveItem(from source: IndexSet, to destination: Int) {
        appState.addressItems.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct Address_Previews: PreviewProvider {
    static var previews: some View {
        Address()
    }
}
