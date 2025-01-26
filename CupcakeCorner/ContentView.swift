//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Joshua Rosado Olivencia on 1/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            // OPTION 1
            
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
            
            // OPTION 2
            // Customizing the size of the image with a ProgressView loading animation
            
            
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
                    .frame(width: 200, height: 200)
            
            
            // OPTION 3
            //Customizing the size of the image with a ProgressView loading animation and THROWING errors
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image")
                } else {
                    ProgressView()
                }
            }
                .frame(width: 200, height: 200)
            
            
            }
            
        }
        
    }


#Preview {
    ContentView()
}
