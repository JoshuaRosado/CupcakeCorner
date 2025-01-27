//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Joshua Rosado Olivencia on 1/22/25.
//



// Separate Framework
import CoreHaptics // *** For Advanced haptics import CoreHaptics
import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    // Create Haptics instance
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        Button("Tap Count: \(counter)"){
            counter += 1
        }
        //=================================================
        // EASY way to customize haptics
        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        //=================================================
        
        
        // ADVANCED way to customize haptics
        
        // If we have Haptic, we start right away
        // If can NOT start Haptic , put ERROR
    }
    func prepareHaptics() {
        // If supports Haptics proceed, if not Exit
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        //DO BLOCK
        do {
            // Make our engine be a new CHHapticEnginer
            engine = try CHHapticEngine()
            //Then try starting engine
            try engine?.start()
            
            // catch any error
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
        
    }
}

#Preview {
    ContentView()
}
