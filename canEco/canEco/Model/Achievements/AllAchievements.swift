//
//  AchievementsGalery.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import Foundation

final class Achievements {
    
    // Usar de base, é na quantidade de ações, nao de desafio
    static var achievements: [(Achievement, Bool)] =
        [(Achievement(name: "Coxas Malhadas", descricao: "Foi de bike pro trabalho 3 vezes", imageEmoji: "🦵") { record in
            record.challengeRecord.filter { $0.name == "Vá de bike ao trabalho" }.count >= 3
        }, false),
        
        (Achievement(name: "Amigo do ambiente", descricao: "Iniciou a reciclagem de lixo", imageEmoji: "🤲") { record in
            record.challengeRecord.filter { $0.name == "Comece a separar o lixo" }.count >= 1
        }, false),
        
        (Achievement(name: "Artista no tempo livre", descricao: "Reutilizou o seu lixo", imageEmoji: "🧑‍🎨") { record in
            record.challengeRecord.filter { $0.name == "Reutilize seu lixo" }.count >= 3
        }, false),

        (Achievement(name: "Minhoqueiro de plantão", descricao: "Iniciou uma composteira", imageEmoji: "🪱") { record in
            record.challengeRecord.filter { $0.name == "Faça uma composteira" }.count >= 1
        }, false),
        
        
        (Achievement(name: "Sacoleiro profissional", descricao: "Usou ecobags", imageEmoji: "🛍️") { record in
            record.challengeRecord.filter { $0.name == "Use ecobags" }.count >= 1
        }, false),
        
        (Achievement(name: "Pesquisador do bairro", descricao: "Usou ecobags", imageEmoji: "🔎") { record in
            record.challengeRecord.filter { $0.name == "Use ecobags" }.count >= 3
        }, false),
        
        (Achievement(name: "Salvador de Tartarugas", descricao: "Deixou de poluir 10 vezes") { record in
            record.benefitRecord.first { $0.benefit == .polution }!.count >= 10
        }, false),
        
        (Achievement(name: "O redutor de gases", descricao: "Passou o dia sem carro") { record in record.challengeRecord.filter { $0.name == "Segunda-feira sem carro" }.count >= 1
        }, false)
        ]
}
