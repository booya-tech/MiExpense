//
//  AppStore.swift
//  MiExpenseTracker
//
//  Created by Panachai Sulsaksakul on 6/8/25.
//

import Combine
import Foundation

final class AppStore: ObservableObject {
    static let shared = AppStore()
    
    @Published private(set) var state = AppState()
    
    func dispatch(_ action: Action) {
        Reducer.reduce(state: &state, action: action)
    }
}
