//
//  User.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import Foundation


final class User {
    static var shared = User()
    var name: String
    var ongoingChallenges: [Challenge] = []
    var record: Record = Record()
    var title: String?

    init(name: String = "") {
        self.name = name
    }
    
    init(name: String, record: Record, ongoingChallenges: [Challenge] = [], title: String? = nil) {
        self.name = name
        self.record = record
        self.title = title
        User.shared = self
    }
    
    func begin(challenge: Challenge) {
        ongoingChallenges.append(challenge)
        save()
    }
    
    func progress(in challenge: Challenge) {
        if challenge.isComplete && challenge.isWaitingConfirmation {
            let index = ongoingChallenges.firstIndex { $0.name == challenge.name && $0.isComplete }!
            ongoingChallenges.remove(at: index)
            record.add(completedChallenge: challenge)
            save()
            return
        }
        
        challenge.completeNextStep()
        
        if challenge.isComplete {
            let index = ongoingChallenges.firstIndex { $0.name == challenge.name && $0.isComplete }!
            User.shared.ongoingChallenges[index].isWaitingConfirmation = true
        }
        
        save()
    }
    
    func rewind(in challenge: StepChallenge) {
        challenge.undoStep()
        save()
    }
    
    func leave(challenge: Challenge) {
        ongoingChallenges.removeAll(where: {$0.name == challenge.name})
        save()
    }
    
    func setSelectedAchievement(_ achievement: Achievement) {
        title = achievement.name
        save()
    }
}

extension User: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case ongoingChallenges
        case record
        case title
    }
    
    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        
        var challengeContainter = c.nestedUnkeyedContainer(forKey: .ongoingChallenges)
        for challenge in ongoingChallenges {
            if let ch = challenge as? RepeatableChallenge {
                try challengeContainter.encode(ch)
            } else if let ch = challenge as? StepChallenge {
                try challengeContainter.encode(ch)
            }
        }
        
        try c.encode(name, forKey: .name)
        try c.encode(record, forKey: .record)
        try c.encode(title, forKey: .title)
    }
    
    
    convenience init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        let name = try c.decode(String.self, forKey: .name)
        let record = try c.decode(Record.self, forKey: .record)
        let title = try c.decode(String?.self, forKey: .title)
        
        self.init(name: name, record: record, title: title)
        self.record.checkAchievements()
        
        var challengeContainer = try c.nestedUnkeyedContainer(forKey: .ongoingChallenges)
        while !challengeContainer.isAtEnd {
            if let ch = try? challengeContainer.decode(RepeatableChallenge.self) {
                ongoingChallenges.append(ch)
            } else if let ch = try? challengeContainer.decode(StepChallenge.self) {
                ongoingChallenges.append(ch)
            }
        }
        
        User.shared = self
    }
    
    func save() {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            
            let data = try encoder.encode(self)

            UserDefaults.standard.set(data, forKey: "User")
            
        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    static func read() {
        if let data = UserDefaults.standard.data(forKey: "User") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                User.shared = try decoder.decode(User.self, from: data)

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
    
}

