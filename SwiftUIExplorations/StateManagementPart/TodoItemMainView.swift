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
        NavigationView {
            List {
                ForEach($viewModel.todoItems) { $todoItems in
                    TodoItemRow(item: $todoItems.onNewValue {
                        viewModel.reorder()
                    })
                }
                .onDelete (perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItems(from:to:))
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Today's Tasks")
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
