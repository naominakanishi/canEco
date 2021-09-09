//
//  CardCollectionViewCell.swift
//  canEco
//
//  Created by Bruno Pastre on 09/09/21.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    let challengeImage = UIImageView()
    let challengeTitle = UILabel()
    let infoButton = UIButton()
    
    let placeholderInformation = UILabel()
    
    let impactTitle = UILabel()
    
    let acceptChallengeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayChallengeImage () {
        challengeImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(challengeImage)
        
        challengeImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        challengeImage.centerYAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        challengeImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        challengeImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 232/129).isActive = true
        
        challengeImage.backgroundColor = .systemBlue
        challengeImage.clipsToBounds = false
    }
    
    func displayChallengeTitle() {
        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(challengeTitle)
        
        challengeTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        challengeTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        challengeTitle.topAnchor.constraint(equalTo: challengeImage.bottomAnchor, constant: 10).isActive = true
        
        challengeTitle.textAlignment = .left
        challengeTitle.numberOfLines = 0
        challengeTitle.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    func displayInfoButton() {
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoButton)
        
        infoButton.leadingAnchor.constraint(equalTo: challengeTitle.trailingAnchor, constant: 10).isActive = true
        infoButton.centerYAnchor.constraint(equalTo: challengeTitle.centerYAnchor).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    
    func displayPlaceholderInformation() {
        placeholderInformation.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placeholderInformation)
        
        placeholderInformation.leadingAnchor.constraint(equalTo: challengeTitle.leadingAnchor).isActive = true
        placeholderInformation.trailingAnchor.constraint(equalTo: infoButton.trailingAnchor).isActive = true
        placeholderInformation.topAnchor.constraint(equalTo: challengeTitle.bottomAnchor, constant: 10).isActive = true
        
        placeholderInformation.numberOfLines = 0
        placeholderInformation.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        
    }
    
    func displayImpactTitle() {
        impactTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(impactTitle)
        
        impactTitle.topAnchor.constraint(equalTo: placeholderInformation.bottomAnchor, constant: 15).isActive = true
        impactTitle.leadingAnchor.constraint(equalTo: challengeTitle.leadingAnchor).isActive = true
        impactTitle.trailingAnchor.constraint(equalTo: infoButton.trailingAnchor).isActive = true
        
        impactTitle.numberOfLines = 0
        impactTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
    }
    
    func displayAcceptChallengeButton() {
        acceptChallengeButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(acceptChallengeButton)
        
        acceptChallengeButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        acceptChallengeButton.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 64/237).isActive = true
        acceptChallengeButton.centerYAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        acceptChallengeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    
    
    
}
