//
//  Task.swift
//  canEco
//
//  Created by Marco Zulian on 01/09/21.
//

import Foundation
    
struct Task {
    let name: String
    let category: [Category]
    let totalSteps: Float = 10
    var completedSteps: Float = 3
    
    static func getTasks() -> [Task] {
        return [Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion]), Task(name: "placeholder", category: [.fashion])]
    }
}
