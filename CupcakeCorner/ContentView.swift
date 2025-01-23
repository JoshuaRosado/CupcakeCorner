//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Joshua Rosado Olivencia on 1/22/25.
//

import SwiftUI

// Networking = Downloading/ Uploading data with the internet

// Synchronous = Runs fully before returning a value as needed

// Async = Goes to sleep while our networking code happens, so that the rest of our app doesn't freez up

// Await =




struct Response: Codable {
    var results: [Result] // array of Result
}
// Result object
struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    var body: some View {
        
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
                    .font(.subheadline)
            }
        }
        // Run a task that awaits the call to load data
        // A sleep MIGHT happen
        .task {
            await loadData()
        }
        
    }
    
    //Step 1
        // Create URL we want to read from Apple's Service
    // Step 2
        // Fetch data from that URL using swift
    //Step 3
        // Decode that result into our Response Struct
    
    func loadData() async {
        
            // STEP 1
        guard let url = URL(string: "https://itunes.apple.com/search?term=bad+bunny&entity=song") else {
            print("Invalid URL")
            return
        }
        
            // STEP 2
        do {
            // (data, discard response)
            let (data, _) = try await URLSession.shared.data(from:url)
            
            //STEP 3
            
            // We can decoded somehow...
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data)
            {
                // append the decoded data to the empty array of Response
                results = decodedResponse.results
            }
            
        } catch { // catch errors
            print("Invalid data")
        }
        
        
    }
}

#Preview {
    ContentView()
}
