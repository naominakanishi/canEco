//
//  Task.swift
//  canEco
//
//  Created by Marco Zulian on 01/09/21.
//

import Foundation
    
protocol Challenge: Codable {
    var name: String { get }
    var category: Category {get }
    var benefits: [Benefits] { get }
    var shortDescription: String { get }
    var isComplete: Bool { get }
    var imageName: String { get }
    var tip: String { get }
    var completionDate: Date? { get set }
    var isWaitingConfirmation: Bool { get set }
    var imageType: ImageTipes { get }
    
    func completeNextStep()
    func copy() -> Self
}

