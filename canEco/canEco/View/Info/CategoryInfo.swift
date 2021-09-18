//
//  CategoryInfo.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

class CategoryInfo: UIView {

    let categoryNameLabel = UILabel()
    let categoryDescriptionLabel = UILabel()
    let categoryTipsLabel = UILabel()
    let categoryTipsDescriptionLabel = UILabel()
    var category: Category! {
        didSet {
            setupTexts()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNameLabel()
        setupDescriptionLabel()
        setupTipsLabel()
        setupTipsDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNameLabel() {
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryNameLabel)
        
        categoryNameLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.09).isActive = true
        categoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.15).isActive = true
        categoryNameLabel.font = UIFont(name: "Ubuntu-Bold", size: 20)
    }
    
    func setupDescriptionLabel() {
        categoryDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryDescriptionLabel)
        
        categoryDescriptionLabel.leadingAnchor.constraint(equalTo: categoryNameLabel.leadingAnchor).isActive = true
        categoryDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        categoryDescriptionLabel.topAnchor.constraint(equalTo: categoryNameLabel.bottomAnchor, constant: 10).isActive = true
        
        categoryDescriptionLabel.numberOfLines = 0
        categoryDescriptionLabel.font = UIFont(name: "Ubuntu-Light", size: 16)
        categoryDescriptionLabel.textAlignment = .justified
    }
    
    func setupTipsLabel() {
        categoryTipsLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryTipsLabel)
        
        categoryTipsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        categoryTipsLabel.trailingAnchor.constraint(equalTo: categoryDescriptionLabel.trailingAnchor).isActive = true
        categoryTipsLabel.topAnchor.constraint(equalTo: categoryDescriptionLabel.bottomAnchor, constant: 20).isActive = true
        
        categoryTipsLabel.text = "Dicas"
        categoryTipsLabel.font = UIFont(name: "Ubuntu-Bold", size: 16)
    }
    
    func setupTipsDescriptionLabel() {
        categoryTipsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryTipsDescriptionLabel)
        
        categoryTipsDescriptionLabel.leadingAnchor.constraint(equalTo: categoryTipsLabel.leadingAnchor).isActive = true
        categoryTipsDescriptionLabel.trailingAnchor.constraint(equalTo: categoryTipsLabel.trailingAnchor, constant: 10).isActive = true
        categoryTipsDescriptionLabel.topAnchor.constraint(equalTo: categoryTipsLabel.bottomAnchor, constant: 20).isActive = true
        categoryTipsDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        categoryTipsDescriptionLabel.numberOfLines = 0
        categoryTipsDescriptionLabel.font = UIFont(name: "Ubuntu-Light", size: 16)
        categoryTipsDescriptionLabel.textAlignment = .justified
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
