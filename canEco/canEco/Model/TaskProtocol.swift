//
//  TaskProtocol.swift
//  canEco
//
//  Created by Marco Zulian on 04/09/21.
//

import UIKit

protocol Task {
    var name: String { get }
    var category: Category { get }
    var benefits: [Benefits] { get }
}

extension Task {
    var benefits: [Benefits] {
        return []
    }
}
