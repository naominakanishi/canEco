//
//  Record.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import Foundation

class Record {
    var challengeRecord: [CompletedChallenge]
    var categoryRecord: [(category: Category, count: Int)] = [(.fashion, 0), (.food, 0), (.shopping, 0),
                                           (.transportation, 0), (.waste, 0)]
    var benefitRecord: [(benefit: Benefits, count: Int)] = [(.co2, 0), (.diseases, 0), (.energy, 0),
                                          (.polution, 0), (.waste, 0), (.water, 0)]
    
    init(record: [CompletedChallenge] = []) {
        self.challengeRecord = record
    }
    
    init(record: [CompletedChallenge], categoryRecord: [(Category, Int)], benefitRecord: [(Benefits, Int)]) {
        self.challengeRecord = record
        self.categoryRecord = categoryRecord
        self.benefitRecord = benefitRecord
    }
    
    
    func add(completedChallenge challenge: CompletedChallenge) {
        challengeRecord.append(challenge)
        
        let index = categoryRecord.firstIndex { $0.category == challenge.challenge.category }!
        categoryRecord[index].count += 1
        
        for benefit in challenge.challenge.benefits {
            let index = benefitRecord.firstIndex { $0.benefit == benefit }!
            benefitRecord[index].count += 1
        }
        
        checkAchievements()
    }
    
    func checkAchievements() {
        for (i, (achievement, completed)) in Achievements.achievements.enumerated() {
            if completed { continue }
            Achievements.achievements[i] = (achievement, achievement.isComplete(self))
        }
    }
}
