//
//  Benefits.swift
//  canEco
//
//  Created by Marco Zulian on 04/09/21.
//

import Foundation

enum Benefits: String, CaseIterable, Codable {
    case water = "Economia de água"
    case co2 = "Redução de CO2"
    case diseases = "Prevenção de doenças"
    case energy = "Economia de energia"
    case waste = "Redução de lixo"
    case polution = "Redução de poluentes"
    
    func getSymbolName() -> String {
        switch self {
            case .water:
                return "drop"
            case .co2:
                return "leaf"
            case .diseases:
                return "cross"
            case .energy:
                return "bolt"
            case .waste:
                return "trash"
            case .polution:
                return "exclamationmark.triangle"
        }
    }
    
}
