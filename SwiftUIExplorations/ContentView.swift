//
//  ContentView.swift
//  SwiftUIExplorations
//
//  Created by Donat on 1.4.25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("shouldDisplayAnimation")
    var shouldDisplayAnimation = true
    
    var body: some View {
        ScrollView {
            VStack() {
                images
                
                VStack(alignment: .leading) {
                    Text("title")
                        .font(.headline)
                    
                    Text("subtitle")
                        .font(.subheadline)
                    
                    HStack(spacing: 0) {
                        ForEach(1...5, id: \.self) { _ in
                            Image(systemName: "star")
                                .foregroundStyle(.yellow)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Text("description")
                        .font(.body)
                    
                }
            }
            .foregroundStyle(.red)
            .padding()
        }
    }
    
    var images: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                HStack() {
                    Image("pikachu")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 175)
                    
                    ForEach(0...2, id: \.self) { item in
                        Image("image-\(item)")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .onAppear {
                guard shouldDisplayAnimation else { return }
                withAnimation {
                    proxy.scrollTo(0, anchor: .center)
                    shouldDisplayAnimation = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .onAppear {
            print("Preview launched!")
            UserDefaults.standard.removeObject(forKey: "shouldDisplayAnimation")
        }
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
