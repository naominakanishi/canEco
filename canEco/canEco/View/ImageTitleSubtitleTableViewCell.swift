//
//  ConcludedChallengeTableViewCell.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

class ImageTitleSubtitleTableViewCell: UITableViewCell {

    let image = UIImageView()
    let title = UILabel()
    
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
        title.numberOfLines = 0
    }
    
    func configureCellInfo(withImage image: UIImage, title: String, andSubtitle subtitle: String) {
        self.image.image = image
//        self.image.layer.backgroundColor = UIColor(named: "blue")?.cgColor
        print(subtitle)
        let attributedText = NSMutableAttributedString(string: "\(title)\n\(subtitle)")
        print(attributedText)
        attributedText.addAttribute(.font, value: UIFont(name: "Ubuntu-Light", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .regular), range: NSRange(location: title.count, length: (subtitle).count))
        attributedText.addAttribute(.font, value: UIFont(name: "Ubuntu-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold), range: _NSRange(location: 0, length: title.count))
        self.title.attributedText = attributedText
        self.title.textColor = UIColor(named: "black")
    }
}
