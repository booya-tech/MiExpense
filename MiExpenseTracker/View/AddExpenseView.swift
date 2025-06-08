//
//  AddExpenseView.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/8/25.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var amount = ""
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
            Button("Save") {
                // Create a new Expense object in the Core Data
                let newExpense = Expense(context: viewContext)
                
                newExpense.id = UUID()
                newExpense.title = title
                newExpense.amount = Double(amount) ?? 0
                newExpense.date = Date()
                
                // Saving the new expense to persistent store
                do {
                    try viewContext.save()
                    
                    AppStore.shared.dispatch(.addExpense(newExpense))
                    
                    presentationMode.wrappedValue.dismiss()
                } catch {
                    print("Failed to save expense: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    AddExpenseView()
}
