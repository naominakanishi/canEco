//
//  StepChallenge.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import Foundation

class StepChallenge: Challenge {
    let name: String
    let category: Category
    let benefits: [Benefits]
    let shortDescription: String = ""
    
    var steps: [(description: String, isComplete: Bool)]
    var isComplete: Bool {
        steps.allSatisfy{ $0.isComplete }
    }
    
    init(name: String, category: Category, benefits: [Benefits], steps: [(String, Bool)]) {
        self.name = name
        self.category = category
        self.benefits = benefits
        self.steps = steps
    }

    func completeNextStep() {
        var step = steps.first { !$0.isComplete }
        step?.isComplete = true
    }
}
