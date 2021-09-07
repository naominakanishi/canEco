//
//  AchievementsGalery.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import Foundation

final class Achievements {
    static var achievements: [Achievement: Bool] =
        [Achievement(name: "Coxas Malhadas") { record in
            record.challengeRecord.filter { $0.challenge.name == "Ir de bike pro trabalho" }.count >= 3
        } : false,
         
        Achievement(name: "Salvador de Tartarugas") { record in
            record.benefitRecord[.polution]! >= 10
        } : false,
        
        ]
}
