//
//  Binding+Extension.swift
//  SwiftUIExplorations
//
//  Created by Donat on 4/7/25.
//

import SwiftUI

extension Binding {
    func onNewValue(_ sideEffect: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: {
                wrappedValue = $0
                sideEffect()
            }
        )
    }
}
