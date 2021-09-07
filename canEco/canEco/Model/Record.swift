//
//  Record.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import Foundation

class Record {
    var challengeRecord: [CompletedChallenge]
    var categoryRecord: [Category: Int] = [.fashion: 0, .food: 0, .shopping: 0,
                                           .transportation: 0, .waste: 0]
    var benefitRecord: [Benefits: Int] = [.co2: 0, .diseases: 0, .energy: 0,
                                          .polution: 0, .waste: 0, .water: 0]
    
    init(record: [CompletedChallenge]) {
        self.challengeRecord = record
    }
    
    init(record: [CompletedChallenge], categoryRecord: [Category: Int], benefitRecord: [Benefits: Int]) {
        self.challengeRecord = record
        self.categoryRecord = categoryRecord
        self.benefitRecord = benefitRecord
    }
    
    
    func add(completedChallenge challenge: Challenge) {
        challengeRecord.append(CompletedChallenge(challenge: challenge))
        
        categoryRecord[challenge.category]! += 1
        
        for benefit in challenge.benefits {
            benefitRecord[benefit]! += 1
        }
        
        checkAchievements()
    }
    
    func checkAchievements() {
        for (achievement, completed) in Achievements.achievements {
            if completed { continue }
            Achievements.achievements[achievement] = achievement.isComplete(self)
        }
    }
}
