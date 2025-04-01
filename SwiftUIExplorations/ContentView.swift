//
//  ContentView.swift
//  SwiftUIExplorations
//
//  Created by Donat on 1.4.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Text("Pokemon: Let's go PIKACHU!")
                .font(.headline)
            
            Text("Nintendo Switch Game")
                .font(.subheadline)
        }
        .foregroundStyle(.red)
        .padding()
        
        VStack { // Implicitly uses @ViewBuilder
            Text("Main Content")

            if showDetails {
                Text("Detailed Information")
                Image(systemName: "info.circle")
            } else {
                Text("Tap button for details")
            }

            Button(showDetails ? "Hide Details" : "Show Details") {
                showDetails.toggle()
            }
        }
        
        MyCustomContainer {
            Text("Item 1")
            Text("Item 2")
            Image(systemName: "globe")
        }
    }
}

#Preview {
    ContentView()
}

struct MyCustomContainer<Content: View>: View {
    // This closure parameter uses @ViewBuilder
    // It accepts a closure that returns 'Content' (which can be multiple views thanks to ViewBuilder)
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(spacing: 20) { // Example layout
            Text("My Custom Header")
            content() // Render the views passed in
            Text("My Custom Footer")
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .clipShape(.buttonBorder)
    }
}
