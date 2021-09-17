//
//  ChallengeRecord.swift
//  canEco
//
//  Created by Marco Zulian on 17/09/21.
//

import Foundation

class CategoryRecord: Codable {
    
    let category: Category
    var count: Int
    
    init(_ category: Category, count: Int = 0) {
        self.category = category
        self.count = count
    }
}
