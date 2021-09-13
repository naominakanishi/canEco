//
//  CompletedChallengeTableViewHeader.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

class CompletedChallengeTableViewHeader: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel()
    let headerButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "bege")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        setupHeaderLabel()
        setupHeaderButton()
    }
    
    func setupHeaderLabel() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(headerLabel)
        
        headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: superview!.frame.width * 0.035).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        headerLabel.textAlignment = .left
        headerLabel.text = "Desafios cumpridos"
        //TODO: Ajuste de fonte
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    func setupHeaderButton() {
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(headerButton)
        
        headerButton.heightAnchor.constraint(equalTo: headerLabel.heightAnchor, multiplier: 1.5).isActive = true
        headerButton.widthAnchor.constraint(equalTo: headerButton.heightAnchor).isActive = true
        headerButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        headerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -superview!.frame.width * 0.035).isActive = true
        
        headerButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        headerButton.tintColor = UIColor(named: "lightGreen")
    }
}
