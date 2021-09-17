//
//  Record.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import Foundation

final class Record {
    var challengeRecord: [Challenge]
    var categoryRecord: [CategoryRecord] = [CategoryRecord(.fashion), CategoryRecord(.food), CategoryRecord(.shopping), CategoryRecord(.transportation), CategoryRecord(.waste)]
    var benefitRecord: [BenefitRecord] = [BenefitRecord(.co2), BenefitRecord(.diseases), BenefitRecord(.energy), BenefitRecord(.polution),
        BenefitRecord(.waste), BenefitRecord(.water)]
    
    init(record: [Challenge] = []) {
        self.challengeRecord = record
    }
    
    init(record: [Challenge], categoryRecord: [CategoryRecord], benefitRecord: [BenefitRecord]) {
        self.challengeRecord = record
        self.categoryRecord = categoryRecord
        self.benefitRecord = benefitRecord
    }
    
    
    func add(completedChallenge challenge: Challenge) {
        var completed = challenge.copy()
        completed.completionDate = Date.init(timeIntervalSinceNow: TimeInterval(0))
        challengeRecord.append(completed)
        
        let index = categoryRecord.firstIndex { $0.category == challenge.category }!
        categoryRecord[index].count += 1
        
        for benefit in challenge.benefits {
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

extension Record: Codable {
    enum CodingKeys: String, CodingKey {
        case challengeRecord
        case categoryRecord
        case benefitRecord
    }
    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        
        var challengeContainter = c.nestedUnkeyedContainer(forKey: .challengeRecord)
        for challenge in challengeRecord {
            if let ch = challenge as? RepeatableChallenge {
                try challengeContainter.encode(ch)
            } else if let ch = challenge as? StepChallenge {
                try challengeContainter.encode(ch)
            }
        }
        
        try c.encode(categoryRecord, forKey: .categoryRecord)
        try c.encode(benefitRecord, forKey: .benefitRecord)
    }
    
    
    convenience init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        
        let categoryRecord = try c.decode([CategoryRecord].self, forKey: .categoryRecord)
        let benefitRecord = try c.decode([BenefitRecord].self, forKey: .benefitRecord)
        
        self.init(record: [], categoryRecord: categoryRecord, benefitRecord: benefitRecord)
        
        var challengeContainer = try c.nestedUnkeyedContainer(forKey: .challengeRecord)
        while !challengeContainer.isAtEnd {
            if let ch = try? challengeContainer.decode(RepeatableChallenge.self) {
                challengeRecord.append(ch)
            } else if let ch = try? challengeContainer.decode(StepChallenge.self) {
                challengeRecord.append(ch)
            }
        }
    }
    
    func save() {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            
            let data = try encoder.encode(self)

            UserDefaults.standard.set(data, forKey: "Record")
            
        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func read() {
        if let data = UserDefaults.standard.data(forKey: "Record") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                User.shared.record = try decoder.decode(Record.self, from: data)

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
}
