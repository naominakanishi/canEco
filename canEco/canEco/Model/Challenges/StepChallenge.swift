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

final class StepChallenge: Challenge, Codable {

    let name: String
    let category: Category
    let benefits: [Benefits]
    let shortDescription: String
    let imageName: String
    let tip: String
    var completionDate: Date?
    var isWaitingConfirmation: Bool
    
    var steps: [ChallengeStep] = []
    var isComplete: Bool {
        steps.allSatisfy{ $0.isComplete }
    }
    
    init(name: String, category: Category, benefits: [Benefits], steps: [(String, String, Bool)], imageName: String = "waste-composter", shortDescription: String = "", tip: String = "", isWaitingConfirmation: Bool = false) {
        self.name = name
        self.category = category
        self.benefits = benefits
        
        for s in steps {
            let step = ChallengeStep(description: s.0, subtitle: s.1, isComplete: s.2)
            self.steps.append(step)
        }
        
        self.imageName = imageName
        self.shortDescription = shortDescription
        self.tip = tip
        self.isWaitingConfirmation = isWaitingConfirmation
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
        var list: [(String, String, Bool)] = []
        for s in steps {
            let tuple = (s.description, s.subtitle, s.isComplete)
            list.append(tuple)
        }
        return StepChallenge(name: name, category: category, benefits: benefits, steps: list, imageName: imageName, shortDescription: shortDescription, tip: tip, isWaitingConfirmation: isWaitingConfirmation)
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

