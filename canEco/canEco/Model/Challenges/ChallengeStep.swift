//
//  ChallangeStep.swift
//  canEco
//
//  Created by Marco Zulian on 17/09/21.
//

import Foundation

class ChallengeStep: Codable {
    let description: String
    let subtitle: String
    var isComplete: Bool
    
    init(description: String, subtitle: String, isComplete: Bool) {
        self.description = description
        self.subtitle = subtitle
        self.isComplete = isComplete
    }
}
