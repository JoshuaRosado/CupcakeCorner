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


class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        // if specialRequestEnabled is not selected or it was unselected
        // extraFrosting and addSprinkles will automatically turn false
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}
