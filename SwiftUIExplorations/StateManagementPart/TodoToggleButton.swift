//
//  TodoToggleButton.swift
//  SwiftUIExplorations
//
//  Created by Ptera on 4/2/25.
//

import SwiftUI

struct TodoToggleButton: View {
    
    @Binding var state: Bool
    
    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                state.toggle()
            }
        } label: {
            GeometryReader { proxy in
                ZStack {
                    Circle()
                        .stroke(lineWidth: 2.0)
                        .foregroundStyle(.blue)
                    
                    if state {
                        Circle()
                            .frame(width: proxy.size.width * 0.8)
                            .foregroundStyle(.blue)
                    }
                }
//                .padding(8)
                .animation(.easeInOut(duration: 0.2), value: state)
            }
        }
        .scaledToFit()
        .buttonStyle(.borderless)
    }
}

#Preview {
    StatefulPreviewWrapper(true) { state in
        TodoToggleButton(state: state)
    }
}
