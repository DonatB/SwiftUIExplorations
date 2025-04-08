//
//  SwiftUIExplorationsApp.swift
//  SwiftUIExplorations
//
//  Created by Donat on 1.4.25.
//

import SwiftUI

enum TabSelection {
    case todoView
    case aboutUs
}

@main
struct SwiftUIExplorationsApp: App {
    
    @State private var currentTab: TabSelection = .todoView
    
    var body: some Scene {
        WindowGroup() {
            TabView(selection: $currentTab) {
                Tab("Todo View", systemImage: "calendar", value: .todoView) {
                    TodoItemMainView()
                }
                .badge(2)
                
                Tab("About us", systemImage: "questionmark.circle.fill", value: .aboutUs) {
                    AboutView()
                }
                .badge("!")
            }
        }
    }
}
