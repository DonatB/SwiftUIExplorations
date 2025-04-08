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
    case thirdView
}

@main
struct SwiftUIExplorationsApp: App {
    
    @State private var currentTab: TabSelection = .todoView
    
    var body: some Scene {
        WindowGroup() {
            //Up to Navigation part
//            TabView(selection: $currentTab) {
//                Tab("Todo View", systemImage: "calendar", value: .todoView) {
//                    TodoItemMainView()
//                }
//                .badge(2)
//                
//                Tab("About us", systemImage: "questionmark.circle.fill", value: .aboutUs) {
//                    AboutView()
//                }
//                .badge("!")
//            }
            TabView(selection: $currentTab) {
                Tab("First", systemImage: "calendar", value: .todoView) {
                    FirstFeatureView()
                }
                
                Tab("Second", systemImage: "questionmark.circle.fill", value: .aboutUs) {
                    SecondFeatureView()
                }
                
                Tab("Third", systemImage: "eraser", value: .thirdView) {
                    ThirdFeatureView()
                }
            }
        }
    }
}
