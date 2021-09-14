//
//  AchievementsGalery.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import Foundation

final class Achievements {
    static var achievements: [(Achievement, Bool)] =
        [(Achievement(name: "Coxas Malhadas", descricao: "Foi de bike pro trabalho 3 vezes") { record in
            record.challengeRecord.filter { $0.challenge.name == "Ir de bike pro trabalho" }.count >= 3
        }, false),
         
        (Achievement(name: "Salvador de Tartarugas", descricao: "Deixou de poluir 10 vezes") { record in
            record.benefitRecord.first { $0.benefit == .polution }!.count >= 10
        }, false),
        
        (Achievement(name: "O redutor de gases", descricao: "Passou o dia sem carro") { record in record.challengeRecord.filter { $0.challenge.name == "Segunda sem carro" }.count >= 1
        }, false)
        ]
}
