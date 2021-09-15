//
//  ChallengeGallery.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import UIKit

final class Challenges {
    static private let challenges: [Challenge] =
        [RepeatableChallenge(name: "Não consumir fast food", category: .food, benefits: [.polution, .co2], totalSteps: 1, imageName: "food-fastfood"),
         RepeatableChallenge(name: "Refeições vegetarianas", category: .food, benefits: [.co2, .diseases, .water], totalSteps: 7, imageName: "food-meals"),
         RepeatableChallenge(name: "Segunda sem carne", category: .food, benefits: [.co2, .diseases, .water], totalSteps: 1, imageName: "food-monday"),
         RepeatableChallenge(name: "Usar produtos em barra", category: .shopping, benefits: [.waste, .polution, .co2], totalSteps: 1, imageName: "consumption-bar"),
         RepeatableChallenge(name: "Usar ecobags", category: .shopping, benefits: [.waste, .diseases, .polution], totalSteps: 1, imageName: "consumption-ecobag"),
         RepeatableChallenge(name: "Comprar a granel", category: .shopping, benefits: [.waste, .polution, .diseases], totalSteps: 1, imageName: "consumption-bulk"),
         RepeatableChallenge(name: "Composteira", category: .waste, benefits: [.waste, .water, .co2], totalSteps: 5, imageName: "waste-composter"),
         RepeatableChallenge(name: "Reutilizar algo que iria para o lixo", category: .waste, benefits: [.waste, .water, .co2], totalSteps: 1, imageName: "waste-reuse"),
         RepeatableChallenge(name: "Separe o lixo", category: .waste, benefits: [.waste, .polution, .co2], totalSteps: 1, imageName: "waste-sorting"),
         RepeatableChallenge(name: "Ir de bike pro trabalho", category: .transportation, benefits: [.polution, .co2, .diseases], totalSteps: 7, imageName: "mobility-bike")]
    
    static func getChallenges() -> [Challenge] {
        return challenges.filter {
            for ch in User.shared.ongoingChallenges {
                if ch.name == $0.name {
                    return false
                }
            }
            return true
        }
    }
}
