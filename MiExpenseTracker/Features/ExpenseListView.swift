//
//  ExpenseListView.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/8/25.
//

import SwiftUI

struct ExpenseListView: View {
    @ObservedObject var store = AppStore.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.state.expenses, id: \.id) { expense in
                    VStack(alignment: .leading) {
                        Text(expense.title)
                            .font(.headline)
                        Text("$\(expense.amount)")
                        Text(expense.date, style: .date)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .navigationTitle("My Expenses")
        .toolbar {
            NavigationLink("Add", destination: AddExpenseView())
        }
    }
}

#Preview {
    ExpenseListView()
}
