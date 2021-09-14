//
//  User.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import Foundation


class User {
    static var shared = User()
    var name: String
    var ongoingChallenges: [Challenge] = []
    var record: Record = Record()

    init(name: String = "") {
        self.name = name
    }
    
    func begin(challenge: Challenge) {
        ongoingChallenges.append(challenge)
    }
    
    func progress(in challenge: Challenge) {
        challenge.completeNextStep()
        
        if challenge.isComplete {
            let index = ongoingChallenges.firstIndex { $0.name == challenge.name && $0.isComplete }!
            ongoingChallenges.remove(at: index)
            let completedChallenge = CompletedChallenge(challenge: challenge)
            record.add(completedChallenge: completedChallenge)
        }
    }
}
