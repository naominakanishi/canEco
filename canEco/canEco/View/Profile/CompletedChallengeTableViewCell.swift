//
//  ConcludedChallengeTableViewCell.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

class CompletedChallengeTableViewCell: UITableViewCell {

    let image = UIImageView()
    let title = UILabel()
    var challenge: CompletedChallenge! {
        didSet {
            configureCellInfo()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImage()
        setupTitle()
        contentView.backgroundColor = UIColor(named: "bege")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.07).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.13).isActive = true
        image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.55).isActive = true
    }
    
    func setupTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        
        title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: contentView.frame.width * 0.07).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        title.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        title.textAlignment = .left
    }
    
    func configureCellInfo() {
        image.image = UIImage(named: "placeholder")
        image.layer.backgroundColor = challenge!.challenge.category.getColor().cgColor
        
        let attributedText = NSMutableAttributedString(string: "\(challenge!.challenge.name)\n\(challenge.completionDate)")
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSRange(location: 0, length: challenge!.challenge.name.count))
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 18), range: NSRange(location: challenge!.challenge.name.count, length: "\(challenge.completionDate)".count))
        title.attributedText = attributedText
    }
}
