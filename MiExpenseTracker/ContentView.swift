//
//  ContentView.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/6/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var isShowAddItemSheet = false
    @State private var expenseTitle: String = ""
    @State private var expenseAmount: String = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("MiExpense")
            .toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                      EditButton()
                  }
                  ToolbarItem(placement: .navigationBarLeading) {
                      Button {
                          isShowAddItemSheet = true
                      } label: {
                          Label("Add Expense", systemImage: "plus")
                      }
                  }
              }
            .sheet(isPresented: $isShowAddItemSheet) {
                VStack(spacing: 20) {
                    Text("Add New Expense")
                        .font(.headline)
                    
                    TextField("Title", text: $expenseTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    TextField("Amount", text: $expenseAmount)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button("Save") {
                        if let amount = Double(expenseAmount), !expenseTitle.isEmpty {
                            addItem(title: expenseTitle, amount: expenseAmount)
                            expenseTitle = ""
                            expenseAmount = ""
                            isShowAddItemSheet = false
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
    }

    private func addItem(title: String, amount: String) {
        withAnimation {
            let newItem = Item(context: viewContext)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
