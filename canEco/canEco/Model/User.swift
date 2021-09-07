//
//  User.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import Foundation


class User {
    var name: String
    var ongoingChallenges: [Challenge] = [RepeatableChallenge(name: "placeholder", category: .fashion, benefits: [.co2], totalSteps: 10),
                                          StepChallenge(name: "placeholder", category: .food, benefits: [.energy, .polution], steps: [("Step1", false), ("Step2", false)])]
    var completedChallenges: [CompletedChallenge] = []
    
    init(name: String) {
        self.name = name
    }
    
    func begin(challenge: Challenge) {
        ongoingChallenges.append(challenge)
    }
    
    func progress(in challenge: Challenge) {
        challenge.completeNextStep()
        
        if challenge.isComplete {
            let index = ongoingChallenges.firstIndex { $0.name == challenge.name }!
            ongoingChallenges.remove(at: index)
            let completedChallenge = CompletedChallenge(challenge: challenge)
            completedChallenges.append(completedChallenge)
        }
    }
    
}
