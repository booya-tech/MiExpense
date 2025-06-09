//
//  ExpenseListState.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/8/25.
//

import Foundation

struct ExpenseViewModel: Identifiable {
    let id: UUID
    let title: String
    let amount: String
    let date: String
}

struct ExpenseListState {
    var expenses: [ExpenseViewModel] = []
}
