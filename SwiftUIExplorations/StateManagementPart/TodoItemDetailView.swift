//
//  TodoItemDetailView.swift
//  SwiftUIExplorations
//
//  Created by Donat on 4/7/25.
//

import SwiftUI

struct TodoItemDetailView: View {
    
    @Binding var item: TodoItem
    
    var body: some View {
        Form {
            TextField("Title", text: $item.title)
                .font(.headline)
            TextField("Description", text: $item.description.whenEmpty(""))
                .font(.subheadline)
        }
    }
}

#Preview {
    let todoItemWithDescription = TodoItem(
        id: UUID(),
        title: "Buy some milk!",
        description: "Lactose free? NEYYYYY!"
    )
    
    StatefulPreviewWrapper(todoItemWithDescription) { todoItem in
        TodoItemDetailView(item: todoItem)
    }
}
