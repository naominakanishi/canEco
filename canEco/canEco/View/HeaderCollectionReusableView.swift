//
//  HeaderCollectionReusableView.swift
//  canEco
//
//  Created by Marco Zulian on 04/09/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel(withText text: String, andSize size: CGRect) {
        let label = UILabel(frame: size)
        self.addSubview(label)
        label.text = text
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.borderWidth = 1
    }
}
