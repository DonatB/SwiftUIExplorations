//
//  TodoItemRow.swift
//  SwiftUIExplorations
//
//  Created by Ptera on 4/2/25.
//

import SwiftUI

struct TodoItemRow: View {
    
    @Binding var item: TodoItem
    
    var body: some View {
        HStack {
            TodoToggleButton(state: $item.isDone)
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isDone)
                
                if let description = item.description {
                    Text(description)
                        .font(.subheadline)
                }
            }
            .padding(.leading)
            
            Spacer()
        }
        .padding()
        .frame(height: 70)
    }
    
}

#Preview(traits: .fixedLayout(width: 300, height: 100)) {
    
    let todoItemWithoutDescription = TodoItem(
        id: UUID(),
        title: "Buy some bread!"
    )
    
    StatefulPreviewWrapper(todoItemWithoutDescription) { todoItem in
        TodoItemRow(item: todoItem)
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 100)) {
    
    let todoItemWithDescription = TodoItem(
        id: UUID(),
        title: "Buy some milk!",
        description: "Lactose free? NEYYYYY!"
    )
    
    StatefulPreviewWrapper(todoItemWithDescription) { todoItem in
        TodoItemRow(item: todoItem)
    }
}
