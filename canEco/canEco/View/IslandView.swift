//
//  IslandView.swift
//  canEco
//
//  Created by Marco Zulian on 18/09/21.
//

import UIKit

class IslandView: UIView {
    
    let imageNames = ["10_cachoeiraSuja-1", "9_garrafas-1", "8_marSujo-1",
                    "7_ilhaSuja-1", "6_carroSujo-1", "5_segundoTopoIlhaSuja-1",
                    "4_topoIlhaSuja-1", "3_folhasArvores-1", "2_ilhaCoisas-1",
                    "1_nuvensPoluicaoElevada-1"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupIsland()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupIsland() {
        for i in 1...10 {
            let image = UIImageView()
            image.image = UIImage(named: imageNames[i-1])
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

}
