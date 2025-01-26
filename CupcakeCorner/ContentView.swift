//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Joshua Rosado Olivencia on 1/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account"){
                    print("Creating account")
                }
                .foregroundStyle(.green)
            }
//            // Disable button if Field are not filled
//            .disabled(username.isEmpty || email.isEmpty)
            
            // Disable button if Field's characters are less than 5
            .disabled(disableForm)
        }
                
    }
    // if username or email are less than 5 character keep the button disabled
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

#Preview {
    ContentView()
}
