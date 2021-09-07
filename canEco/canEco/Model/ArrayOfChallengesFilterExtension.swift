//
//  ArrayOfTasksExtension.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import Foundation

extension Array where Element: Challenge {
    func filterChallenges(inCategories categories: [Category]) -> [Challenge] {
        self.filter { categories.contains($0.category) }
    }

    func filterChallenges(withNameContaining text: String) -> [Challenge] {
        self.filter{ $0.name.contains(text) }
    }

    func filterChallenges(inCategories categories: [Category], withNameContaining text: String) -> [Challenge] {
        self.filter{ categories.contains($0.category) && $0.name.contains(text) }
    }
}
