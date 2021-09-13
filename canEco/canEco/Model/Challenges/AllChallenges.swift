//
//  ChallengeGallery.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import UIKit

final class Challenges {
    static private let challenges: [Challenge] =
        [RepeatableChallenge(name: "Segunda sem carro", category: .transportation, benefits: [.co2, .polution, .diseases], totalSteps: 6),
         StepChallenge(name: "Composteira", category: .waste, benefits: [.waste, .co2], steps: [
            ("Construir uma composteira", false),
            ("Construir uma composteira", false),
            ("Construir uma composteira", false),
            ("Construir uma composteira", false),
            ("Construir uma composteira", false),
         ]),
         StepChallenge(name: "Composteira", category: .fashion, benefits: [.waste], steps: [("Construir uma composteira", false)]),
         StepChallenge(name: "Composteira", category: .food, benefits: [.waste], steps: [("Construir uma composteira", false)]),
         StepChallenge(name: "Composteira", category: .shopping, benefits: [.waste], steps: [("Construir uma composteira", false)]),
         RepeatableChallenge(name: "Segunda sem carro", category: .transportation, benefits: [.co2, .polution, .diseases], totalSteps: 1),
          StepChallenge(name: "Composteira", category: .waste, benefits: [.waste], steps: [("Construir uma composteira", false)]),
          StepChallenge(name: "Composteira", category: .fashion, benefits: [.waste], steps: [("Construir uma composteira", false)]),
          StepChallenge(name: "Composteira", category: .food, benefits: [.waste], steps: [("Construir uma composteira", false)]),
          StepChallenge(name: "Composteira", category: .shopping, benefits: [.waste], steps: [("Construir uma composteira", false)])]
    
    static func getChallenges() -> [Challenge] {
        return challenges
    }
}
