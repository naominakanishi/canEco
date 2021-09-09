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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel(withText text: String, andSize size: CGRect) {
        let label = UILabel(frame: size)
        self.addSubview(label)
        label.text = text
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor(named: "black")
        label.textAlignment = .center
        label.backgroundColor = UIColor(named: "bege")
//        label.layer.borderWidth = 1
    }
}
