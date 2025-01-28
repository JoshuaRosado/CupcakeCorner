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
        Button("Pay Haptic", action: complexSuccess)
            .onAppear(perform: prepareHaptics)
        //=================================================
        // EASY way to customize haptics
        
//        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
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
    
    func complexSuccess() {
        // If supports Haptics proceed, if not Exit
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        // Array of events
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 2.5, by: 0.1){
            
            // specifying the intensity
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 12)
            // specifyinh the sharpness
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 20)
            
            // creating an event with OUR customized parameters
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
