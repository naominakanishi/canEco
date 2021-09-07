//
//  BenefitCell.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import UIKit

class BenefitCell: UIView {

    let name = UILabel()
    let image = UIImageView()
    var benefit: Benefits? {
        didSet {
            configureCellContent()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupNameLabel()
        setupImageLabel()
        
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 1
    }
    
    func setupNameLabel() {
        name.translatesAutoresizingMaskIntoConstraints = false
        addSubview(name)
        name.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        name.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        name.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.375).isActive = true
        name.widthAnchor.constraint(equalToConstant: 78).isActive = true
        name.textAlignment = .center
        name.numberOfLines = 0
        name.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    func setupImageLabel() {
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: name.topAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.54).isActive = true
    }
    
    func configureCellContent() {
        name.text = benefit!.rawValue
        image.image = UIImage(systemName: benefit!.getSymbolName())
    }
}
