//
//  RepeatableTask.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import Foundation

final class RepeatableChallenge: Challenge, Codable {
    
    let name: String
    let category: Category
    let benefits: [Benefits]
    let shortDescription: String
    let imageName: String
    let tip: String
    var completionDate: Date?
    
    var totalSteps: Int
    var completedSteps: Int = 0
    var isComplete: Bool { completedSteps == totalSteps }
    var isWaitingConfirmation: Bool

    init(name: String, category: Category, benefits: [Benefits], totalSteps: Int, imageName: String = "waste-composter", shortDescription: String = "", tip: String = "", isWaitingConfirmation: Bool = false) {
        self.name = name
        self.category = category
        self.benefits = benefits
        self.totalSteps = totalSteps
        self.imageName = imageName
        self.shortDescription = shortDescription
        self.tip = tip
        self.isWaitingConfirmation = isWaitingConfirmation
    }
    
    func completeNextStep() {
        completedSteps = min(completedSteps + 1, totalSteps)
    }
    
    func copy() -> RepeatableChallenge {
        return RepeatableChallenge(name: name, category: category, benefits: benefits, totalSteps: totalSteps, imageName: imageName, shortDescription: shortDescription, tip: tip, isWaitingConfirmation: isWaitingConfirmation)
    }
}

extension RepeatableChallenge: StepCounter {}
