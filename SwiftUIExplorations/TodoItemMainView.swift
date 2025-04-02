//
//  TodoItemMainView.swift
//  SwiftUIExplorations
//
//  Created by Ptera on 4/2/25.
//

import SwiftUI

struct TodoItemMainView: View {
    
    @State var todoItems: [TodoItem] = (
        try? .fromJSON(
            named: "TodoItems"
        )
    ) ?? []
    
    var body: some View {
        List($todoItems) { todoItems in
            TodoItemRow(item: todoItems)
        }
    }
}

#Preview {
    TodoItemMainView()
}
