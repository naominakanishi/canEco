//
//  NewChallengeCardCollectionViewCell.swift
//  canEco
//
//  Created by Marco Zulian on 05/09/21.
//

import UIKit

class NewChallengeCardCollectionViewCell: UIView {
    
    let imageView = UIImageView()
    let challengeTitle = UILabel()
    let header = UILabel()
    let benefits = UIStackView()
    var challenge: Challenge! {
        didSet {
            imageView.image = UIImage(named: challenge.name)
            challengeTitle.text = challenge.name
            
            for benefit in challenge.benefits {
                let subview = BenefitCell()
                subview.benefit = benefit
                benefits.addArrangedSubview(subview)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
        setupChallengeTitle()
        setupHeader()
        setupBenefits()
        
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 126).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 227).isActive = true
        imageView.clipsToBounds = false
        imageView.backgroundColor = UIColor(named: "yellow")
    }
    
    func setupChallengeTitle() {
        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(challengeTitle)
        challengeTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        challengeTitle.textAlignment = .left
        challengeTitle.numberOfLines = 0
        
        challengeTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        challengeTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        challengeTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        challengeTitle.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupHeader() {
        header.translatesAutoresizingMaskIntoConstraints = false
        addSubview(header)
        header.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        header.textAlignment = .left
        
        header.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        header.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        header.topAnchor.constraint(equalTo: challengeTitle.bottomAnchor, constant: 30).isActive = true
        header.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        header.text = "Impactos Positivos"
    }
    
    func setupBenefits() {
        benefits.translatesAutoresizingMaskIntoConstraints = false
        addSubview(benefits)
        
        benefits.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        benefits.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        benefits.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        benefits.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        benefits.layer.borderColor = UIColor.blue.cgColor
        benefits.layer.borderWidth = 1
        benefits.axis = .horizontal
        benefits.alignment = .fill
        benefits.distribution = .equalSpacing
    }
    
}
