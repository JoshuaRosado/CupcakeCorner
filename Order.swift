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

@Observable
class Order: ObservableObject, Codable {
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

    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
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
