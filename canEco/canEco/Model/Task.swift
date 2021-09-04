//
//  Task.swift
//  canEco
//
//  Created by Marco Zulian on 01/09/21.
//

import Foundation
    
struct Task {
    let name: String
    let category: Category
    let totalSteps: Float = 10
    var isExpanded: Bool = false
    var completedSteps: Float = 3
    
    static func getTasks() -> [Task] {
        return [Task(name: "placeholder", category: .fashion), Task(name: "placeholder", category: .fashion),
                Task(name: "placeholder", category: .food), Task(name: "placeholder", category: .food),
                Task(name: "placeholder", category: .shopping), Task(name: "placeholder", category: .shopping),
                Task(name: "placeholder", category: .transportation), Task(name: "placeholder", category: .transportation),
                Task(name: "placeholder", category: .waste), Task(name: "placeholder", category: .waste),
                Task(name: "placeholder", category: .waste), Task(name: "placeholder", category: .fashion)]
    }
}
