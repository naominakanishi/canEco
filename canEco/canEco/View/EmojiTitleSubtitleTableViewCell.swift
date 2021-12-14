//
//  EmojiTitleSubtitleTableViewCell.swift
//  canEco
//
//  Created by Marco Zulian on 14/12/21.
//

import UIKit

class EmojiTitleSubtitleTableViewCell: UITableViewCell {

    let emoji = UILabel()
    let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupEmoji()
        setupTitle()
        contentView.backgroundColor = UIColor(named: "bege")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupEmoji() {
        emoji.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emoji)
        
        emoji.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.07).isActive = true
        emoji.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        emoji.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.13).isActive = true
        emoji.heightAnchor.constraint(equalTo: emoji.widthAnchor, multiplier: 0.55).isActive = true
    }
    
    func setupTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        
        title.leadingAnchor.constraint(equalTo: emoji.trailingAnchor, constant: contentView.frame.width * 0.07).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        title.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        title.textAlignment = .left
        title.numberOfLines = 0
    }
    
    func configureCellInfo(withEmoji emoji: String, title: String, andSubtitle subtitle: String) {
        self.emoji.text = emoji
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
