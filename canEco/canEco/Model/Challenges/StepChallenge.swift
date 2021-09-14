//
//  StepChallenge.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import Foundation

protocol StepCounter {
    var totalSteps: Int { get }
    var completedSteps: Int { get }
}

final class StepChallenge: Challenge {

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
    
    func copy() -> StepChallenge {
        return StepChallenge(name: name, category: category, benefits: benefits, steps: steps)
    }
}

extension StepChallenge: StepCounter {
    var totalSteps: Int {
        steps.count
    }
    
    var completedSteps: Int {
        steps.filter { $0.isComplete }.count
    }
}
