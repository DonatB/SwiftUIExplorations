//
//  TodoItemMainView.swift
//  SwiftUIExplorations
//
//  Created by Ptera on 4/2/25.
//

import SwiftUI

struct TodoItemMainView: View {
    
    @StateObject var viewModel = TodoItemsListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.todoItems) { $todoItem in
                    NavigationLink(value: todoItem) {
                        TodoItemRow(item: $todoItem.onNewValue {
                            viewModel.reorder()
                        })
                    }
                }
                .onDelete (perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItems(from:to:))
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Today's Tasks")
            .navigationDestination(for: TodoItem.self, destination: { todoItem in
                let todoItemBinding = Binding(
                    get: {
                        viewModel.todoItems.first(where: { $0.id == todoItem.id })!
                    },
                    set: { newItem in
                        let index = viewModel.todoItems.firstIndex(where: { $0.id == todoItem.id })!
                        viewModel.todoItems[index] = newItem
                    }
                )
                TodoItemDetailView(item: todoItemBinding)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .onAppear() {
                viewModel.loadItems()
            }
        }
    }
    
}

#Preview {
    TodoItemMainView()
}
