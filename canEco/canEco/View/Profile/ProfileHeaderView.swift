//
//  ProfileHeaderView.swift
//  canEco
//
//  Created by Marco Zulian on 11/09/21.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var achievementLabel = UILabel()
    var islandImage = UIImageView()
    
    override var bounds: CGRect {
        didSet {
            setupAchievementLabel()
            setupIslandImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "lightBlue")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAchievementLabel() {
        achievementLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(achievementLabel)
        
        let attributedString = NSMutableAttributedString(string: "SALVADOR DE TARTARUGA")
        attributedString.addAttribute(.kern, value: 2, range: NSRange(location: 0, length: attributedString.length))
        achievementLabel.attributedText = attributedString
        achievementLabel.font = UIFont(name: "Ubuntu-Bold", size: 24)
        achievementLabel.textColor = UIColor(named: "accentGreen")
        achievementLabel.numberOfLines = 0
        
        achievementLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: superview!.frame.width * 0.035).isActive = true
        achievementLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: bounds.height * 0.1).isActive = true
        achievementLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func setupIslandImage() {
        islandImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(islandImage)
        
        islandImage.image = UIImage(named: "ilhaPlaceholder")
        islandImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: bounds.height * 0.1).isActive = true
        islandImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -superview!.frame.width * 0.035).isActive = true
        islandImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        islandImage.widthAnchor.constraint(equalTo: islandImage.heightAnchor, multiplier: aspectRatio).isActive = true
    }
    
    
    //MARK: Constants
    let aspectRatio: CGFloat = 291.63 / 252.24

}
