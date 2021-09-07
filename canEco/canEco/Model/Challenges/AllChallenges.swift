//
//  ChallengeGallery.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import UIKit

final class Challenges {
    static private let challenges: [Challenge] =
        [RepeatableChallenge(name: "Segunda sem carro", category: .transportation, benefits: [.co2, .polution, .diseases], totalSteps: 1),
         StepChallenge(name: "Composteira", category: .waste, benefits: [.waste], steps: [("Construir uma composteira", false)])]
    
    static func getChallenges() -> [Challenge] {
        return challenges
    }
}
