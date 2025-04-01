//
//  AdvancedLayoutView.swift
//  SwiftUIExplorations
//
//  Created by Donat on 1.4.25.
//

import SwiftUI

extension VerticalAlignment {
    enum AccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let accountAndName = VerticalAlignment(AccountAndName.self)
}

struct AdvancedLayoutView: View {
    
    var body: some View {
        HStack(alignment: .accountAndName) {
            VStack {
                Text("Pika pika!")
                    .alignmentGuide(.accountAndName) { d in
                        d[VerticalAlignment.center] }
                    .padding()
                    .background(.blue)
                
                Image("pikachu")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .background(.yellow)
            }
            
            VStack {
                Text("POKEMON")
                    .background(.red)
                
                Text("GOTTA CATCH EM ALL!!")
                    .alignmentGuide(.accountAndName) { d in
                        d[VerticalAlignment.center] }
                    .font(.largeTitle)
                    .padding()
                    .background(.green)
            }
        }
        .padding()
    }
}

struct AdvancedLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedLayoutView()
    }
}
