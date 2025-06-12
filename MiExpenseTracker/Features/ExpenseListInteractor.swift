//
//  ExpenseListInteractor.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/8/25.
//

import CoreData

class ExpenseListInteractor {
    static func fetchExpenses(context: NSManagedObjectContext) {
        // Builds a Core Data fetch request for Expense entities.
        let request: NSFetchRequest<Expense> = Expense.fetchRequest()
        // Executes the fetch using the passed NSManagedObjectContext.
        if let expenses = try? context.fetch(request) {
            // Sends a Redux-style Action (setExpenses) to your centralized AppStore, which holds your app’s state.
            AppStore.shared.dispatch(.setExpenses(expenses))
        }
    }
}
