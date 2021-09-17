//
//  Category.swift
//  canEco
//
//  Created by Marco Zulian on 01/09/21.
//

import Foundation
import UIKit

enum Category: String, CaseIterable, Codable {
    case transportation = "MOBILIDADE"
    case food = "ALIMENTAÇÃO"
    case fashion = "MODA"
    case waste = "LIXO ZERO"
    case shopping = "CONSUMO"
    
    func getColor() -> UIColor {
        switch self {
            case .transportation:
                return UIColor(named: "lightGreen")!
            case .food:
                return UIColor(named: "darkOrange")!
            case .fashion:
                return UIColor(named: "blue")!
            case .waste:
                return UIColor(named: "brown")!
            case .shopping:
                return UIColor(named: "yellow")!
        }
    }
    
    func getExplication() -> String {
        return "Aqui é a explicação daquele impacto ali, em até umas 5 linhas, porque 5 linhas é bastante, talvez mais que isso seja mutcho texto e sei lá, mutcho texto??? Talvez. O que pode ser feito é colocar mais coisas em dicas. Dicas são legais pô."
    }
    
    func getTips() -> String {
        return "Lorem ipsum dolor sit lorem ipsum dolor sit orem ipsum dolor sit lorem ipsum dolor sit orem ipsum dolor sit lorem ipsum dolor sit "
    }
    
}

