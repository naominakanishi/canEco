//
//  IslandView.swift
//  canEco
//
//  Created by Marco Zulian on 18/09/21.
//

import UIKit

class IslandView: UIView {
    
    var imageNames: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        imageNames = getIslandComponents()
        setupIsland()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupIsland() {
        for view in subviews{
            view.removeFromSuperview()
        }
        imageNames = getIslandComponents()
        for i in 0..<imageNames.count {
            let image = UIImageView()
            image.image = UIImage(named: imageNames[i])
            image.translatesAutoresizingMaskIntoConstraints = false
            addSubview(image)
            
            NSLayoutConstraint.activate([
                image.leadingAnchor.constraint(equalTo: leadingAnchor),
                image.trailingAnchor.constraint(equalTo: trailingAnchor),
                image.topAnchor.constraint(equalTo: topAnchor),
                image.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }
    
    func getIslandComponents() -> [String] {
        var dict: [ImageTipes: Int] = .init(uniqueKeysWithValues: ImageTipes.allCases.map { ($0, 0) })
        
        for challange in User.shared.record.challengeRecord {
            dict[challange.imageType]! += 1
        }
        
        var imageNames: [String] = []
        imageNames.append(dict[.any]! <= 3 ? "10_cachoeiraSuja-1" : "10_cachoeiraLimpa-1")
        imageNames.append(dict[.any]! <= 7 ? "9_garrafas-1" : "9_peixes-1")
        imageNames.append(dict[.any]! <= 10 ? "8_marSujo-1" : "8_marLimpo-1")
        imageNames.append(dict[.any]! <= 9 ? "7_ilhaSuja-1" : "7_ilhaLimpa-1")
        
        let carOrBike = dict[.bike]! >= 3 ? "bicicleta" : "carro"
        imageNames.append(dict[.any]! <= 8 ? "6_\(carOrBike)Sujo-1" : "6_\(carOrBike)Limpa-1")
        
        var islandSecondTop = dict[.any]! <= 2 ? "5_segundoTopoIlhaSuja" : "5_segundoTopoIlhaLimpa"
        if dict[.cow]! >= 2 { islandSecondTop += "Vaca" }
        islandSecondTop += "-1"
        print(islandSecondTop)
        imageNames.append(islandSecondTop)
        
        var islandTop = dict[.any]! <= 4 ? "4_topoIlhaSuja" : "4_topoIlhaLimpa"
        if dict[.cow]! >= 3 { islandTop += "Vaca" }
        islandTop += "-1"
        print(islandTop)
        imageNames.append(islandTop)
        
        imageNames.append(dict[.any]! <= 5 ? "" : "3_folhasArvores-1")
        imageNames.append("2_ilhaCoisas-1")
        
        var cloudCoverage: String
        if dict[.any]! <= 1 {
            cloudCoverage = "Elevada"
        } else if dict[.any]! <= 6 {
            cloudCoverage = "Media"
        } else if dict[.any]! <= 10 {
            cloudCoverage = "Baixa"
        } else {
            cloudCoverage = ""
        }
        imageNames.append("1_nuvensPoluicao\(cloudCoverage)-1")
        
        return imageNames
    }

}

enum ImageTipes: Int, CaseIterable, Codable {
    case any
    case bike
    case cow
}
