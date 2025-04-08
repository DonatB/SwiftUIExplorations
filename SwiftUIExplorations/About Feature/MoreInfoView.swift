//
//  MoreInfoView.swift
//  SwiftUIExplorations
//
//  Created by Donat on 4/8/25.
//

import SwiftUI

struct MoreInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    MoreInfoView()
}
