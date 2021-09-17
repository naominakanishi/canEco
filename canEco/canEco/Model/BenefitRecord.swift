//
//  BenefitRecord.swift
//  canEco
//
//  Created by Marco Zulian on 17/09/21.
//

import Foundation

class BenefitRecord: Codable {
    
    let benefit: Benefits
    var count: Int
    
    init(_ benefit: Benefits, count: Int = 0) {
        self.benefit = benefit
        self.count = count
    }
    
}
