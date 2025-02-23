//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Joshua Rosado Olivencia on 2/14/25.
//

import SwiftUI

struct AddressView: View {
    

    @Bindable var order: Order
    var body: some View {
        Form {
            Section{
                TextField("Name", text: $order.name)
                
                
                TextField("Streed Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section{
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }
            // Disable the Check out Button
            // if the Address fields are not field
            .disabled(!order.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        
        
        // Challenge 3 =================================
        // When View disappears, Save data to UserDefaults
        
        .onDisappear(perform: {
            if let data = try? JSONEncoder().encode(order) {
                UserDefaults.standard.set(data, forKey:
                "orderKey")
            }
        })
        
        // When View Appears, Load data from UserDefaults
        
        .onAppear(perform: {
            
            if let object = UserDefaults.standard.value(forKey: "orderKey") as? Data {
                if let loadedOrder = try? JSONDecoder().decode(Order.self, from: object) {
                    self.order.name = loadedOrder.name
                    self.order.name = loadedOrder.streetAddress
                    self.order.name = loadedOrder.city
                    self.order.name = loadedOrder.zip
                    print("object loaded")
                }
            }
        })
        
        
    }
}

#Preview {
    AddressView(order: Order())
}
