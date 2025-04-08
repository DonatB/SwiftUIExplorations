//
//  TodoItem.swift
//  SwiftUIExplorations
//
//  Created by Ptera on 4/2/25.
//

import Foundation

struct TodoItem: Codable, Identifiable, Hashable {
    let id: UUID
    var title: String
    var description: String?
    var isDone: Bool = false
}
