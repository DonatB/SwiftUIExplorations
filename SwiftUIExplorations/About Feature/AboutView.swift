//
//  AboutView.swift
//  SwiftUIExplorations
//
//  Created by Donat on 4/8/25.
//

import SwiftUI

struct AboutView: View {
    
    @State private var isMoreInfoPresented = false
    
    var body: some View {
        VStack {
            Text("About meeeeeeeeeeeeeeeeeeeee view.")
                .padding()
            
            Button("More info?") {
                isMoreInfoPresented.toggle()
            }
        }
        .sheet(isPresented: $isMoreInfoPresented) {
            MoreInfoView()
                .presentationDetents([.medium, .large, .fraction(0.7)])
        }
    }
}

#Preview {
    AboutView()
}
