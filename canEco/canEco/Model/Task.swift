//
//  Task.swift
//  canEco
//
//  Created by Marco Zulian on 01/09/21.
//

import Foundation
    
struct RegularTask: Task {
    var name: String
    var category: Category
    var benefits: [Benefits]
    
    let totalSteps: Float = 10
    var completedSteps: Float = 3
    
    static func getTasks() -> [RegularTask] {
//        []
        return [RegularTask(name: "placeholder", category: .fashion, benefits: []),
                RegularTask(name: "placeholder", category: .food, benefits: []),
                RegularTask(name: "placeholder", category: .shopping, benefits: []),
                RegularTask(name: "placeholder", category: .transportation, benefits: []),
                RegularTask(name: "placeholder", category: .waste, benefits: [])]
    }
}
