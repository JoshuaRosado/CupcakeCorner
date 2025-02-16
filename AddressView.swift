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
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

#Preview {
    AddressView(order: Order())
}
