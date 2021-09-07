//
//  CompletedChallenge.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import Foundation

class CompletedChallenge {
    let challenge: Challenge
    let completionDate: Date
    
    init(challenge: Challenge) {
        self.completionDate = Date()
        self.challenge = challenge
    }
}
