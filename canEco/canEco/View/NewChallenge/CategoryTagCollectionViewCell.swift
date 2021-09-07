//
//  CategoryTagCollectionViewCell.swift
//  canEco
//
//  Created by Marco Zulian on 04/09/21.
//

import UIKit

class CategoryTagCollectionViewCell: UICollectionViewCell {
    
    enum DisplayMode {
        case fill
        case unfill
    }
    
    var label = UILabel()
    var category: Category? {
        didSet {
            configureCell()
        }
    }
    var displayMode: DisplayMode = .unfill {
        didSet {
            configureCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        contentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height * 0.1).isActive = true
        
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        label.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell() {
        if category != nil {
            label.text = category!.rawValue
            if displayMode == .fill {
                label.textColor = .white
                contentView.layer.backgroundColor = category?.getColor().cgColor
            } else {
                label.textColor = category?.getColor()
                contentView.layer.backgroundColor = UIColor.white.cgColor
            }
        } else {
            label.text = "TODOS"
            if displayMode == .fill {
                label.textColor = .white
                contentView.layer.backgroundColor = UIColor(named: "brown")?.cgColor
            } else {
                label.textColor = UIColor(named: "brown")
                contentView.layer.backgroundColor = UIColor.white.cgColor
            }
        }
        contentView.layer.borderColor = category?.getColor().cgColor
    }
    
}
