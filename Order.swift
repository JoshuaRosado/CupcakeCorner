//
//  Order.swift
//  CupcakeCorner
//
//  Created by Joshua Rosado Olivencia on 2/14/25.
//




// What is MVVM architecture in SwiftUI

// Model-View-ViewModel (MVVM) is an architectural pattern that separates a software application's user interface (UI) from its business (or back-end) logic. MVVM is used to facilitate application development, testing, maintenance and collaboration.

import SwiftUI
// @State = Manages simple, locate state variables that belong to a single SwiftUI view

// @Published = Works with ObservableObject protocol to notify SwiftUI views of changes in shared data, allowing updates to propagate across multiple views or within a hierarchy
extension String{
    var isReallyEmpty: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
        // Trim all the whitespaces if the String has any WhiteSpace
        // White spaces are not allowed to count as a space.
    }
}
@Observable
class Order: ObservableObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _name = "name"
        case _city = "city"
        case _zip = "zip"
        case _streetAddress = "streetAddress"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
    
    }
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
     var type = 0
     var quantity = 3
    
     var specialRequestEnabled = false {
        // if specialRequestEnabled is not selected or it was unselected
        // extraFrosting and addSprinkles will automatically turn false
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    

    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    
    // Validating that all 4 TextField are field

    // CHALLENGE 1
    // VALIDATE the address making sure that the String IS NOT a pure EMPTY SPACE
    
    var hasValidAddress: Bool {
        if name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zip.isReallyEmpty {
            
            return false
        }
        return true
}
    
    // ================================================================================
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cake cost more
        cost += Decimal(type) / 2
        
        // $1 cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.50 cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}
