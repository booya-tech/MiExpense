//
//  Reducer.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/8/25.
//

import Foundation

enum Reducer {
    static func reduce(state: inout AppState, action: Action) {
        switch action {
        case .setExpenses(let expenses):
            state.expenses = expenses
        case .addExpense(let expense):
            state.expenses.append(expense)
        }
    }
}
