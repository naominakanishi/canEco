//
//  Achievement.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import Foundation

class Achievement: Hashable {
    
    let name: String
    let descricao: String
    let imageEmoji: String
    var isComplete: ((Record) -> Bool)
    
    
    init(name: String, descricao: String, imageEmoji: String = "" , isComplete: @escaping (Record) -> Bool) {
        self.name = name
        self.descricao = descricao
        self.isComplete = isComplete
        self.imageEmoji = imageEmoji
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Achievement, rhs: Achievement) -> Bool {
        lhs.name == rhs.name
    }
}
