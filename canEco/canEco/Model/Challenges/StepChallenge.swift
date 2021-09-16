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
    let shortDescription: String
    let imageName: String
    let tip: String
    
    var steps: [(description: String, subtitle: String, isComplete: Bool)]
    var isComplete: Bool {
        steps.allSatisfy{ $0.isComplete }
    }
    
    init(name: String, category: Category, benefits: [Benefits], steps: [(String, String, Bool)], imageName: String = "waste-composter", shortDescription: String = "", tip: String = "") {
        self.name = name
        self.category = category
        self.benefits = benefits
        self.steps = steps
        self.imageName = imageName
        self.shortDescription = shortDescription
        self.tip = tip
    }

    func completeNextStep() {
        let index = steps.firstIndex { !$0.isComplete }
        steps[index!].isComplete = true
    }
    
    func undoStep() {
        let index = steps.lastIndex { $0.isComplete }
        steps[index!].isComplete = false
    }
    
    func copy() -> StepChallenge {
        return StepChallenge(name: name, category: category, benefits: benefits, steps: steps, imageName: imageName)
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
