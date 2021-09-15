//
//  RepeatableTask.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import Foundation

final class RepeatableChallenge: Challenge {
    let name: String
    let category: Category
    let benefits: [Benefits]
    let shortDescription: String = ""
    let imageName: String
    
    var totalSteps: Int
    var completedSteps: Int = 0
    var isComplete: Bool { completedSteps == totalSteps }

    init(name: String, category: Category, benefits: [Benefits], totalSteps: Int, imageName: String = "waste-composter") {
        self.name = name
        self.category = category
        self.benefits = benefits
        self.totalSteps = totalSteps
        self.imageName = imageName
    }
    
    func completeNextStep() {
        completedSteps = min(completedSteps + 1, totalSteps)
    }
    
    func copy() -> RepeatableChallenge {
        return RepeatableChallenge(name: name, category: category, benefits: benefits, totalSteps: totalSteps)
    }
}

extension RepeatableChallenge: StepCounter {}
