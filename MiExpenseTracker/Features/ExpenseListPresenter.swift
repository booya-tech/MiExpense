//
//  ExpenseListPresenter.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/8/25.
//

import Foundation

class ExpenseListPresenter {
    static func map(expenses: [Expense]) -> [ExpenseViewModel] {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return expenses.map { expense in
            ExpenseViewModel(
                id: expense.id,
                title: expense.title,
                amount: formatter.string(from: NSNumber(value: expense.amount)) ?? "$0.00",
                date: dateFormatter.string(from: expense.date)
            )
        }
    }
}
