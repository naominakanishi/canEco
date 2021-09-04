//
//  Category.swift
//  canEco
//
//  Created by Marco Zulian on 01/09/21.
//

import Foundation
import UIKit

enum Category: CaseIterable {
    case transportation
    case food
    case fashion
    case waste
    case shopping
    
    func getColor() -> UIColor {
        switch self {
            case .transportation:
                return UIColor(named: "blue")!
            case .food:
                return UIColor(named: "darkOrange")!
            case .fashion:
                return UIColor(named: "darkBlue")!
            case .waste:
                return UIColor(named: "mediumGreen")!
            case .shopping:
                return UIColor(named: "yellow")!
        }
    }
}

