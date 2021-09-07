//
//  Achievement.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import Foundation

class Achievement: Hashable {
    
    let name: String
    var isComplete: ((Record) -> Bool)
    
    
    init(name: String, isComplete: @escaping (Record) -> Bool) {
        self.name = name
        self.isComplete = isComplete
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Achievement, rhs: Achievement) -> Bool {
        lhs.name == rhs.name
    }
}
