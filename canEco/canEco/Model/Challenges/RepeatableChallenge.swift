//
//  RepeatableTask.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import Foundation

class RepeatableChallenge: Challenge {
    let name: String
    let category: Category
    let benefits: [Benefits]
    let shortDescription: String = ""
    
    var totalSteps: Int
    var completedSteps: Int = 0
    var isComplete: Bool { completedSteps == totalSteps }

    init(name: String, category: Category, benefits: [Benefits], totalSteps: Int) {
        self.name = name
        self.category = category
        self.benefits = benefits
        self.totalSteps = totalSteps
    }
    
    func completeNextStep() {
        completedSteps = min(completedSteps + 1, totalSteps)
    }
}

extension RepeatableChallenge: StepCounter {}
