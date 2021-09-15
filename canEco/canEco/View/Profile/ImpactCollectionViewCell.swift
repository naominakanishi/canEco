//
//  ImpactStackViewLabel.swift
//  canEco
//
//  Created by Marco Zulian on 11/09/21.
//

import UIKit

class ImpactCollectionViewCell: UICollectionViewCell {

    let countLabel = UILabel()
    let nameLabel = UILabel()
    let bgImage = UIImageView()
    
    override var bounds: CGRect {
        didSet {
            setupBgImage()
            setupCountLabel()
            setupNameLabel()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "lightGreen")
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBgImage() {
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgImage)
        
        let image = Int.random(in: 1...2)
        bgImage.image = UIImage(named: "impactLabelBg\(image)")
        
        bgImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bgImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        bgImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bgImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    func setupCountLabel() {
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countLabel)
        
        countLabel.font = UIFont.boldSystemFont(ofSize: 25)
        countLabel.textColor = .white
        countLabel.numberOfLines = 1
        countLabel.textAlignment = .center
        
        countLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
    }
    
    func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)

        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 2
        nameLabel.textAlignment = .left
        
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.05 * bounds.width).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bounds.height * 0.05).isActive = true
    }
    
    func setupLabels(forBenefit benefit: Benefits, withCount count: Int) {
        countLabel.text = "\(count)"
        nameLabel.text = benefit.rawValue
    }
}
