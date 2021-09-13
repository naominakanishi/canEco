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
    }
    
    func configureCellInfo(withImage image: UIImage, title: String, andSubtitle subtitle: String?) {
        self.image.image = image
        self.image.layer.backgroundColor = UIColor(named: "blue")?.cgColor
        
        let attributedText = NSMutableAttributedString(string: "\(title)\n\(subtitle ?? "")")
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSRange(location: 0, length: title.count))
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 18), range: NSRange(location: title.count, length: (subtitle ?? "").count))
        self.title.attributedText = attributedText
    }
}
