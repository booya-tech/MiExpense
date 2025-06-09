//
//  ExpenseListInteractor.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/8/25.
//

import CoreData

class ExpenseListInteractor {
    static func fetchExpenses(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Expense> = Expense.fetchRequest()
        if let expenses = try? context.fetch(request) {
            AppStore.shared.dispatch(.setExpenses(expenses))
        }
    }
}
