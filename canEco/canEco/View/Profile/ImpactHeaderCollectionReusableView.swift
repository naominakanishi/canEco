//
//  ImpactHeaderCollectionReusableView.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

class ImpactHeaderCollectionReusableView: UICollectionReusableView {
    
    let headerLabel = UILabel()
    let headerButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeaderLabel()
        setupHeaderButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeaderLabel() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerLabel)
        
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.035).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        headerLabel.textAlignment = .left
        headerLabel.text = "Seus impactos"
        //TODO: Ajuste de fonte
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    func setupHeaderButton() {
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerButton)
        
        headerButton.heightAnchor.constraint(equalTo: headerLabel.heightAnchor, multiplier: 1.5).isActive = true
        headerButton.widthAnchor.constraint(equalTo: headerButton.heightAnchor).isActive = true
        headerButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        headerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -frame.width * 0.035).isActive = true
        
        headerButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        headerButton.tintColor = UIColor(named: "lightGreen")
    }
}
