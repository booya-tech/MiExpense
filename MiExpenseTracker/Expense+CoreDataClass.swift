//
//  Expense+CoreDataClass.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/8/25.
//

import Foundation
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {}

extension Expense {
    @nonobjc public class func fetchRequest() ->  NSFetchRequest<Expense> {
        return NSFetchRequest(entityName: "Expense")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var amount: Double
    @NSManaged public var date: Date
}
