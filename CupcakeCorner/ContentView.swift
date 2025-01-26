//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Joshua Rosado Olivencia on 1/22/25.
//

import SwiftUI

@Observable
class User: Codable {
    // Fixing the coding key
    // From "{"_name":"Cataleya","_$observationRegistrar":{}}"
    // To {"name" : "Cataleya"}
    // by replacing _name with "name"
    enum CodingKeys : String, CodingKey {
        case _name = "name"
    }
    var name = "Cataleya"
}

struct ContentView: View {
    
    var body: some View {
        Button("Encode Cataleya", action:  encodeCataleya)
    }
    
    func encodeCataleya() {
        // data instance = try encoding a new User
        let data = try! JSONEncoder().encode(User())
        // str instance = displaying the data
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentView()
}
