//
//  AddressItem.swift
//  inty
//
//  Created by Creative Ones on 11/21/22.
//

import SwiftUI

struct AddressItem: Identifiable, Codable {
    var id = UUID()
    var alias: String
    var isHeader: Bool = false
    var isFooter: Bool = false
}
