//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Joshua Rosado Olivencia on 1/22/25.
//




import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    var body: some View{
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in : 3...20)
                }
                Section{
                    // Using toggle with the Bool and add animation once its tapped
                    Toggle("Any special requests?" , isOn: $order.specialRequestEnabled.animation())
                    
                    // if Bool is true display 2 extra Toggles
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section{
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
    
    
}

#Preview {
    ContentView()
}
