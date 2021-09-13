//
//  CategoryInfo.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

class CategoryInfo: UITableViewCell {

    let categoryNameLabel = UILabel()
    let categoryDescriptionLabel = UILabel()
    let categoryTipsLabel = UILabel()
    let categoryTipsDescriptionLabel = UILabel()
    var category: Category! {
        didSet {
            setupNameLabel()
            setupDescriptionLabel()
            setupTipsLabel()
            setupTipsDescriptionLabel()
            setupTexts()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNameLabel() {
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryNameLabel)
        
        categoryNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        categoryNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.09).isActive = true
        categoryNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height * 0.15).isActive = true
        categoryNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func setupDescriptionLabel() {
        categoryDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryDescriptionLabel)
        
        categoryDescriptionLabel.leadingAnchor.constraint(equalTo: categoryNameLabel.leadingAnchor).isActive = true
        categoryDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        categoryDescriptionLabel.topAnchor.constraint(equalTo: categoryNameLabel.bottomAnchor, constant: 20).isActive = true
        
        categoryDescriptionLabel.numberOfLines = 0
        categoryDescriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }
    
    func setupTipsLabel() {
        categoryTipsLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryTipsLabel)
        
        categoryTipsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.12).isActive = true
        categoryTipsLabel.trailingAnchor.constraint(equalTo: categoryDescriptionLabel.trailingAnchor).isActive = true
        categoryTipsLabel.topAnchor.constraint(equalTo: categoryDescriptionLabel.bottomAnchor, constant: 40).isActive = true
        
        categoryTipsLabel.text = "Dicas"
        categoryTipsLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupTipsDescriptionLabel() {
        categoryTipsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryTipsDescriptionLabel)
        
        categoryTipsDescriptionLabel.leadingAnchor.constraint(equalTo: categoryTipsLabel.leadingAnchor).isActive = true
        categoryTipsDescriptionLabel.trailingAnchor.constraint(equalTo: categoryTipsLabel.trailingAnchor).isActive = true
        categoryTipsDescriptionLabel.topAnchor.constraint(equalTo: categoryTipsLabel.bottomAnchor, constant: 20).isActive = true
        categoryDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentView.frame.height * 0.12).isActive = true
        
        categoryTipsDescriptionLabel.numberOfLines = 0
        categoryTipsDescriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }
    
    func setupTexts() {
        categoryNameLabel.text = category?.rawValue.capitalized
        categoryNameLabel.textColor = category?.getColor()
        
        categoryDescriptionLabel.text = category?.getExplication()
        
        categoryTipsLabel.textColor = category?.getColor()
        
        categoryTipsDescriptionLabel.text = category?.getTips()
        setNeedsLayout()
    }
}
